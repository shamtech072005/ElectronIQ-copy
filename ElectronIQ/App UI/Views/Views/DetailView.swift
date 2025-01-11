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
    var body: some View {
        NavigationStack{
            ZStack{
                viewBackgroundColor(selectedElement: selectedElement)
                AppBackground()
                Header(content: "\(elementsNames[selectedElement]) - \(elementsNumber[selectedElement])", selectedElement: selectedElement)
                HStack{
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 10) // Step 1: Create Rounded Rectangle
                                    .stroke(elementCardColor[selectedElement],style:     StrokeStyle(lineWidth: 2)) // Fill color for the rounded rectangle
                                    .frame(width: screenWidth * 0.3,height: screenWidth * 0.2)
                                HStack{
                                    
                                    renderElementCard(selectedElement: selectedElement)
                                    ScalableImageView(imgName: "\(elementsSymbols[selectedElement])_Img")
                                }
                                .scaleEffect(0.8)
                            }
                                renderBasicParticlesOfAnAtom(selectedElement: selectedElement)
                        }
                        .offset(y:screenHeigth * 0.012)
                     
                    
                        VStack{
                            elementDetailTableView(selectedElement: selectedElement)
                            applicationOfAtom(selectElement: selectedElement)
                        }
                    
                    
                    
                        renderValanceElectron(selectedElement: selectedElement)
                    
                }
                .offset(y:screenHeigth * 0.03)
                .scaleEffect(isIPhone ? 0.85:1.1)
                .foregroundColor(contentFontColor)
                
                
            }
            .blur(radius:isDrawerOpen ? 3:0)
            .overlay{
                Button(action: {dismiss()}, label: {BouncingBackButton(selectedElement: selectedElement)})
                    .scaleEffect(isIPhone ? 0.6:1)
                    .offset(x:isIPhone ? -1 * screenWidth * 0.4:-1 * screenWidth * 0.375,y:isIPhone ? -1 * screenHeigth * 0.17:-1 * screenHeigth * 0.3)
                   
                Drawer(isDrawerOpen: isDrawerOpen)
                drawerButton(isDrawerOpen: $isDrawerOpen)
               
            }
            .overlay{
                if !isIPhone{
                    AdBannerView().frame(width:screenWidth * 0.8,height: 100)
                        .offset(y:screenHeigth * 0.3)
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

#Preview {
    DetailView(selectedElement: 102)
}
@ViewBuilder
func applicationOfAtom(selectElement:Int)->some View{
    ZStack{
        RoundedRectangle(cornerRadius: 10)
            .fill(elementCardColor[selectElement])
            .frame(width: screenWidth * 0.3,height: screenWidth * 0.2)
        
       
    }
    .overlay(alignment:.top){
        Text("Applications of \(elementsNames[selectElement])")
            .font(.custom(atomSymbolFont, size: 16))
            .padding(.all,5)
    }
    .overlay(alignment:.center){
        HStack{
            VStack(alignment:.leading){
                Text("1) \(elementUses[selectElement][0])")
                Text("2) \(elementUses[selectElement][1])")
                Text("3) \(elementUses[selectElement][2])")
             }
            .font(.custom(atomSymbolFont, size: 13))
            Image("\(elementsSymbols[selectElement])_Rimg")
                   .resizable()
                   
                   .frame(width:isIPhone ? screenWidth*0.1:screenWidth*0.12,height: isIPhone ? screenWidth*0.1:screenWidth*0.12)
                   .cornerRadius(5)
                   .padding()
                   .onAppear{
                       print("\(elementsSymbols[selectElement])_Rimg")
                   }
        }
        .padding()
        
                   
    }
    .foregroundColor(contentFontColor)
}
