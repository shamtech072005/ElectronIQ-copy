import SwiftUI

// Example usage of the ContactInfoView with actual data
struct ContentViewdd: View {
    @State var selectedElement:Int = 102
    var body: some View {
        ZStack{
            Circle()
                .fill(.red)
                .frame(width: screenWidth * 0.04 , height: screenWidth * 0.04)
            Text("S")
            Text("\(selectedElement)")
                .offset(x:10, y: -10)
        }
        .foregroundColor(contentFontColor)
    }
}
#Preview {
    ContentViewdd()
}

