//
//  ArrowShape.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 10/11/24.
//
import SwiftUI
struct ArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Arrow shaft
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        // Arrow head
        path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.midY - 10))
        path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.midY + 10))
        
        return path
    }
}

struct ShapeProvider:PreviewProvider{
    static var previews: some View{
        ElectronicConfiguration(selectedElement: 102)
    }
}
struct DottedArrow:View {
    var body: some View {
        ArrowShape()
        .stroke(style: StrokeStyle(lineWidth: 2, dash: [3]))
                        .foregroundColor(.gray)
                        .frame(width: 70, height: 1,alignment:.bottomTrailing)
    }
}
struct AnimatedArrow: View {
    @State var noOfElectron:Int
    @State private var trimAmount: CGFloat = 0.0
    @State private var showText = false
    let color:Color
    let arrowRotation:Int
    let textRotation:Int
    let arrowWidth:CGFloat
    let shellSymbol:String
    var body: some View {
            HStack(spacing: 0) {
                ArrowShape()
                    .trim(from: 0, to: trimAmount)
                    .stroke(color, lineWidth: 2)
                    .frame(width: arrowWidth)
                    .onAppear() {
                        withAnimation(Animation.easeInOut(duration: 2)) {
                            trimAmount = 1.0
                        }
                        
                        // More precise timing control
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.spring()) {
                                showText = true
                            }
                        }
                    }
                
                    ZStack{
                        Circle().fill(color).frame(width:35)
                        Text(shellSymbol)
                            .font(.custom(atomSymbolFont, size: 24))
                            
                            
                        Circle().fill(color).frame(width:25)
                            .overlay{
                                Text("\(noOfElectron)")
                                    .font(.custom(atomSymbolFont, size: 12))
                            }
                            .offset(x:17,y:-17)
                            
                    }
                    .rotationEffect(Angle(degrees: Double(textRotation)),anchor: .center)
                    
                    
                        
//                .shadow(color:isShadow ? color:.clear,radius: 10)
                
                .opacity(showText ? 1:0)
            
              
                
                
            }
            .rotationEffect(Angle.degrees(Double(arrowRotation)),anchor: .leading)
            .foregroundColor(contentFontColor)
                   
    }
    }


