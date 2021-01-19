import SwiftUI

struct SendButton: View {
	var action: () -> ()
	var body: some View {
		Button(action: action) {
			Image(systemName: "paperplane.fill")
				.resizable()
				.scaledToFit()
				.padding(12)
				.frame(height: 38, alignment: .center)
		}
	}
}
