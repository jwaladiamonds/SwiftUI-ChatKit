import SwiftUI

struct MessageScrollView<Message: Identifiable>: View {
	var messages: [Message]
	var messageContent: () -> Void
	var body: some View {
		ScrollViewReader { scrollView in
			ScrollView(.vertical, showsIndicators: false) {
				VStack(alignment: .leading) {
					ForEach(messages) { message in
						messageContent(message: message)
					}
				}
				.padding(.horizontal)
				.frame(maxWidth: .infinity, alignment: .leading)
			}
		}
	}
}