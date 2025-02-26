import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack {
            Color.pink
            Button("Hello world!") {
                
            }
            .font(.title)
            .padding(20)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
