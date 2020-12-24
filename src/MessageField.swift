import SwiftUI

struct MessageView: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var height: CGFloat
    var placeholder: String
    
    func makeCoordinator() -> Coordiator {
        return MessageField.Coordiator(parent: self, placeholder: placeholder)
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
        DispatchQueue.main.async {
            self.height = textView.contentSize.height
        }
    }
    
    class Coordiator: NSObject, UITextViewDelegate {
        var parent: MessageField
        var placeholder: String
        
        init(parent: MessageField, placeholder: String) {
            self.parent = parent
            self.placeholder = placeholder
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if self.parent.text == "" {
                textView.text = ""
                textView.textColor = .label
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if self.parent.text == "" {
                textView.text = placeholder
                textView.textColor = .lightGray
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
        MessageView(text: self.$text, height: self.$height)
            .frame(height: self.height < 150 ? self.height : 150)
            .padding(.horizontal)
            .background(Color(.systemBackground))
            .cornerRadius(10)
}