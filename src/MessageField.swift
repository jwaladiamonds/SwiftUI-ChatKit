import SwiftUI

struct MessageView: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var height: CGFloat
    var placeholder: String
    @State var isEditing: Bool = false
    
    func makeCoordinator() -> Coordiator {
        return MessageView.Coordiator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isEditable = true
        view.isScrollEnabled = true
        view.text = placeholder
        view.font = .systemFont(ofSize: 18)
        view.textColor = .lightGray
        view.backgroundColor = .clear
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        if self.text == "" {
            textView.text = self.isEditing ? "" : self.placeholder
            textView.textColor = self.isEditing ? .label : .lightGray
        }
        DispatchQueue.main.async {
            self.height = textView.contentSize.height
        }
    }
    
    class Coordiator: NSObject, UITextViewDelegate {
        var parent: MessageView
        
        init(parent: MessageView) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            DispatchQueue.main.async {
                self.parent.isEditing = true
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            DispatchQueue.main.async {
                self.parent.isEditing = false
            }
        }
        
        func textViewDidChange(_ textView: UITextView) {
            DispatchQueue.main.async {
                self.parent.height = textView.contentSize.height
                self.parent.text = textView.text
            }
        }
        
    }
}

struct MessageField: View {
    
    @Binding var text: String
    @State private var height: CGFloat = 0
    let placeholder = "Message"
    var sendText: () -> ()
    
    var body: some View {
        HStack {
            MessageView(text: self.$text, height: self.$height, placeholder: self.placeholder)
                .frame(height: self.height < 150 ? self.height : 150)
                .padding(.horizontal)
                .background(Color(.systemBackground))
                .cornerRadius(10)
            Button(action: {
                if self.text.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                    self.sendText()
                    self.text = ""
                    print("Message sent")
                }
            }, label: {
                Image(systemName: "paperplane.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(12)
                    .frame(height: 38, alignment: .center)
            })
        }
    }
}
