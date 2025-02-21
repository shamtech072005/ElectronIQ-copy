//
//  DetailView.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 08/11/24.
//

import SwiftUI
import FirebaseAnalytics
struct DetailView: View {
    @State var selectedElement:Int
    @State private var isDrawerOpen: Bool = false
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack{
            ZStack{
                viewBackgroundColor()
                AppBackground()
                Header(content: "\(elementsNames[selectedElement]) - \(elementsNumber[selectedElement])", selectedElement: selectedElement)
                
                HStack{
                        VStack{
                            
                                RoundedRectangle(cornerRadius: 10) // Step 1: Create Rounded Rectangle
                                .fill(elementCardColor[selectedElement]) // Fill color for the rounded rectangle
                                    .frame(width: screenWidth * 0.3,height: screenWidth * 0.2)
                                    .overlay(alignment:.top){
                                        VStack{
                                            Text("Element Card")
                                                .font(.custom(atomSymbolFont, size: 16))
                                                .padding(.top,isIPhone ? 10:15)
                                            Divider()
                                                .frame(width:screenWidth*0.3,height: 2)
                                                .overlay(.blackFont)
                                        }
                                        .offset(y:-1 * screenWidth * 0.0025)
                                    }
                                    .overlay(alignment:.center){
                                        HStack{
                                            renderElementCard(selectedElement: selectedElement)
                                            ScalableImageView(imgName: "\(elementsSymbols[selectedElement])_Img")
                                        }
                                        .offset(y:screenWidth*0.02)
                                    }
                                    
                            
                                    .offset(y:-1*screenWidth*0.015)
                            renderBasicParticlesOfAnAtom(selectedElement: selectedElement)
                        }
                        .offset(y:screenWidth * 0.0175)
                     
                    
                        VStack{
                            elementDetailTableView(selectedElement: selectedElement)
                            applicationOfAtom(selectElement: selectedElement)
                        }
                    
                    
                    VStack{
                        renderValanceElectron(selectedElement: selectedElement)

                        renderNavigationButtons(selectedElement: selectedElement)
                    }
                    .offset(x:isIPhone ? -1 * screenWidth * 0.02:-1 * screenWidth * 0.01)
                }
                .offset(x:screenWidth * 0.015,y:isIPhone ? screenWidth * 0.03:screenWidth * 0.01)
                .scaleEffect(isIPhone ? 0.75:0.85)
                .foregroundColor(contentFontColor)
                HStack(spacing:isIPhone ? screenWidth * 0.575:screenWidth * 0.65) {
                    ElementNavigatorLeft(selectedElement: $selectedElement)
                    ElementNavigatorRight(selectedElement: $selectedElement)
                }
                .scaleEffect(1.3)
                .offset(y:screenWidth * 0.03)
                
            }
            .blur(radius:isDrawerOpen ? 3:0)
            .overlay{
                Button(action: {dismiss()}, label: {BouncingBackButton(selectedElement: selectedElement)})
                    .scaleEffect(isIPhone ? 0.6:1)
                    .offset(x:isIPhone ? -1 * screenWidth * 0.4:-1 * screenWidth * 0.375,y:isIPhone ? -1 * screenWidth * 0.17:-1 * screenWidth * 0.3)
                   
                Drawer(isDrawerOpen: isDrawerOpen)
                drawerButton(isDrawerOpen: $isDrawerOpen)
               
            }
            .overlay{
                if !isIPhone{
                    AdBannerView().frame(width:screenWidth * 0.8,height: 100)
                        .offset(y:screenWidth * 0.3)
                }
            }
        }
        .onAppear{
            Analytics.logEvent("Detail_View", parameters: ["Detail_View":"Deatil_View_Appeared"])
            print("Detail_view_appeared")
        }
        
        .navigationBarBackButtonHidden(true)
    }
}


@ViewBuilder
func applicationOfAtom(selectElement:Int)->some View{
    ZStack{
        RoundedRectangle(cornerRadius: 10)
            .fill(elementCardColor[selectElement])
            .frame(width: screenWidth * 0.3,height: screenWidth * 0.2)
        
       
    }
    .overlay(alignment:.top){
        VStack{
            Text("Applications of \(elementsNames[selectElement])")
                .font(.custom(atomSymbolFont, size: 16))
                .padding(.top,isIPhone ? 10:15)
            Divider()
                .frame(width:screenWidth*0.3,height: 2)
                .overlay(.blackFont)
        }
    }
//    .overlay(alignment:.bottom){
//        ZStack{
//            Capsule().stroke(style: StrokeStyle(lineWidth: 2)).frame(width: screenWidth * 0.2,height:screenWidth * 0.03)
//            Link(destination: URL(string: elementUsesVediosLink[selectElement])!, label: {
//                HStack(spacing:0){
//                    Image(systemName: "play.circle")
//                        .scaledToFit()
//                        .offset(x:isIPhone ? 15:25)
//                    Text("Watch & Learn")
//                        .font(.custom(atomSymbolFont, size: 13))
//                        .frame(width:screenWidth * 0.15,height: screenHeigth * 0.02)
//                    
//                }
//            })
//        }
//        .padding(.bottom,5)
//    }
    .overlay(alignment:.center){
            HStack{
                Image("\(elementsSymbols[selectElement])_Rimg")
                    .resizable()
                
                    .frame(width:isIPhone ? screenWidth*0.135:screenWidth*0.115,height: isIPhone ? screenWidth*0.135:screenWidth*0.115)
                    .cornerRadius(10)
                    
                    .frame(width:isIPhone ? screenWidth*0.14:screenWidth*0.12,height: isIPhone ? screenWidth*0.14:screenWidth*0.12)
                    .background(.white)
                    .cornerRadius(10)
                VStack(alignment:.leading){
                    ForEach(0..<3,id:\.self){i in
                        HStack{
                            Circle()
                                .fill(contentFontColor)
                                .frame(width: screenWidth*0.01, height: screenWidth*0.01)
                            Text("\(elementUses[selectElement][i])")
                                .font(.custom(atomSymbolFont, size:isIPhone ? 13:14))
                        }
                        
                    }
                    
                }
                .frame(width: 100, height: 10, alignment: .center)
               
                .multilineTextAlignment(.leading)
               
                
            }
            .offset(y:screenWidth*0.02)
            .padding()
            .onAppear{
                print("count of uses \(elementUses.count)")
            }
    }
    .foregroundColor(contentFontColor)
}

#Preview {
    DetailView(selectedElement: 10)
}
