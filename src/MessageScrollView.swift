import SwiftUI

public typealias VerticalPadding = CGFloat
public typealias HorizontalPadding = CGFloat

struct MessageScrollView<Content: View>: View {
    
    var messages: [Message]
	var content: (Message) -> Content
    let padding: HorizontalPadding
    
    init(messages: [Message], padding:  HorizontalPadding = 10, @ViewBuilder _ content: @escaping (Message) -> Content) {
        self.content = content
        self.messages = messages
        self.padding = padding
    }
    
	var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(messages) { message in
                        content(message).tag(message.id)
                    }
                }
                .padding(.horizontal, padding)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .background(Color(.systemGroupedBackground))
        .onTapGesture {
            UIApplication.shared.windows.first?.rootViewController?.view.endEditing(true)
        }
	}
}
