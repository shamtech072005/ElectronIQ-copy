//
//  AufbaPrinciple.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 14/11/24.
//

import SwiftUI
import FirebaseAnalytics
struct AufbaPrinciple: View {
    @State var selectedElement:Int
   
    @State private var isAppearFlags = Array(repeating: false, count: 19)
    @State private var isBumbingFlags = Array(repeating: false, count: 19)
    
    let spacing:CGFloat = 5
    var body: some View {
        VStack(alignment: .leading,spacing:spacing){
            HStack(spacing:spacing){
                AufbaElementCard(content: content[0], color: spdfColors[0], isColor: isAppearFlags[0], isBumping: isBumbingFlags[0], index: 0)
            }
            HStack(spacing:spacing){
                ForEach(0..<2,id: \.self){sub in
                    AufbaElementCard(content: "\(content[sub+1])", color: spdfColors[sub], isColor: isAppearFlags[sub+1], isBumping: isBumbingFlags[sub+1], index: sub)
                }
            }
            HStack(spacing:spacing){
                ForEach(0..<3,id: \.self){sub in
                    AufbaElementCard(content: "\(content[sub+3])", color: spdfColors[sub], isColor: isAppearFlags[sub+3], isBumping: isBumbingFlags[sub+3], index: sub)
                }
            }
            HStack(spacing:spacing){
                ForEach(0..<4,id: \.self){sub in
                    AufbaElementCard(content: "\(content[sub+6])", color: spdfColors[sub], isColor: isAppearFlags[sub+6], isBumping: isBumbingFlags[sub+6], index: sub)
                }
            }
            HStack(spacing:spacing){
                ForEach(0..<4,id: \.self){sub in
                    AufbaElementCard(content: "\(content[sub+10])", color: spdfColors[sub], isColor: isAppearFlags[sub+10], isBumping: isBumbingFlags[sub+10], index: sub)
                }
            }
            HStack(spacing:spacing){
                ForEach(0..<3,id: \.self){sub in
                    AufbaElementCard(content: "\(content[sub+14])", color: spdfColors[sub], isColor: isAppearFlags[sub+14], isBumping: isBumbingFlags[sub+14], index: sub)
                }
            }
            HStack(spacing:spacing){
                ForEach(0..<2,id: \.self){sub in
                    AufbaElementCard(content: "\(content[sub+17])", color: spdfColors[sub], isColor: isAppearFlags[sub+17], isBumping: isBumbingFlags[sub+17], index: sub)
                }
            }
        }
        .onAppear{
            animateElementCard()
        }
    }
    func animateElementCard() {
        
        let filledSubShells: [Int] = [2,6,10,14]
        for (index, i) in APR.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 1) { // Delays each animation based on its sequence
                if electronicConfiguration[selectedElement][i] != 0 {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isAppearFlags[i] = true
                        if
                            !filledSubShells.contains(electronicConfiguration[selectedElement][i]) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                               isBumbingFlags[i] = true
                            }
                            
                            print("is bumping \(isBumbingFlags[i]) trued")
                        }
                    }
                    print("Index \(i) animated.")
                }
            }
        }
    }

}

struct AufbaElementCard: View {
    var content: String
    var color: Color
    var isColor: Bool
    var isBumping: Bool
    var index: Int

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 2)
                .frame(width: 33)
                .scaleEffect(isBumping ? 1.1 : 1) // Slightly larger scale effect for bumping
                .animation(.easeIn(duration: 0.5).repeatForever(autoreverses: true),value: isBumping)

            Circle()
                .fill(isColor ? color : Color.white)
                .frame(width: 30)
                .scaleEffect(isBumping ? 1.1 : 1)
                .animation(.easeIn(duration: 0.5).repeatForever(autoreverses: true),value: isBumping)

            Text(content)
                .font(.custom(aufbaPrincipleCardFont, size: 14))
                .foregroundColor(isColor ? .white : .black)
                .animation(.easeIn(duration: 0.5).repeatForever(autoreverses: true),value: isBumping)
        }
        .background {
            Group {
                if index == 0 {
                    DottedArrow()
                } else {
                    DottedLine()
                }
            }
            .rotationEffect(Angle(degrees: 135))
        }
    }
}

struct AufbaIntegerationView:View{
    @State var selectedElement:Int
    @State var incrementer:Int = 0
    @State private var isDrawerOpen: Bool = false
    @Environment(\.dismiss) var dismiss
    var body: some View{
        NavigationStack{
            ZStack{
                AppBackground()
                viewBackgroundColor(selectedElement: selectedElement)
                Header(content: "\(elementsNames[selectedElement]) - \(elementsNumber[selectedElement])", selectedElement: selectedElement)
                AufbaPrinciple(selectedElement: selectedElement)
                    .scaleEffect(isIPhone ? 1:1.3)
                ElectronicScoreboard(selectedElement: selectedElement)
                incrementerSideBar()
            }
            .blur(radius:isDrawerOpen ? 3:0)
            .overlay{
                Button(action: {dismiss()}, label: {BouncingBackButton(selectedElement: selectedElement)})
                    .scaleEffect(isIPhone ? 0.6:1)
                    .offset(x:isIPhone ? -1 * screenWidth * 0.4:-1 * screenWidth * 0.375,y:isIPhone ? -1 * screenHeigth * 0.17:-1 * screenHeigth * 0.3)
                Drawer(isDrawerOpen: isDrawerOpen)
                drawerButton(isDrawerOpen: $isDrawerOpen)
                
            }
            
        }
        
        .navigationBarBackButtonHidden(true)
    }
    @ViewBuilder
    func incrementerSideBar()->some View{
        
        Group{
            RoundedRectangle(cornerRadius: 10)
                .fill(elementCardColor[selectedElement])
                .frame(width: screenWidth * 0.15, height: screenWidth * 0.15)
                .overlay(alignment:.top){
                    Text("Electrons")
                        .font(.custom(headerFont, size: 16))
                        .bold()
                        .padding()
                        
                }
                .overlay{
                    Text("\(incrementer)")
                        .font(.custom(headerFont, size: 38))
                }
        }
        .foregroundStyle(contentFontColor)
        .onAppear{
            Analytics.logEvent("Aufba_View", parameters: ["aufbaView":"Aufba_View_Appeared"])
            print("periodic_Table_view_appeared")
            animateIncrementer()
        }
        .offset(x:screenWidth * 0.25)
    }
    func animateIncrementer(){
        for index in 0..<electronicConfiguration[selectedElement].count{
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 1) {
                withAnimation(.easeInOut){
                    incrementer+=electronicConfiguration[selectedElement][APR[index]]
                }
            }
        }
    }
    
    func ElectronicScoreboardCard(index:Int) -> some View {
        HStack{
            RoundedRectangle(cornerRadius: 5)
                .fill(spdfOrdering[index])
                .frame(width: screenWidth*0.025,height: screenWidth*0.025)
                .overlay{
                    Text("\(electronicConfiguration[selectedElement][index])")
                        .font(.custom(headerFont, size: 16))
                        .foregroundStyle(contentFontColor)
                }
            Text("\(content[index])")
                .font(.custom(atomSymbolFont, size: 16))
                .foregroundStyle(contentFontColor)
        }
    }
    @ViewBuilder
    func ElectronicScoreboard(selectedElement: Int) -> some View {
       
        Group{
            RoundedRectangle(cornerRadius: 20)
                .fill(elementCardColor[selectedElement])
                .frame(width: screenWidth * 0.25, height: screenHeigth * 0.34)
                .overlay(alignment:.top){
                    Text("Electronic Configuration")
                        .font(.custom(headerFont, size:isIPhone ? 14:16))
                        .bold()
                        .foregroundStyle(contentFontColor)
                        .padding()
                }// Add text overlay with dynamic element name
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5) // Subtle shadow for depth
               
                .overlay(alignment:.center){
                    HStack{
                        VStack(alignment:.leading){
                            ForEach(0..<10){i in
                                ElectronicScoreboardCard(index:i)
                            }
                        }
                        .padding(.leading,30)
                        Spacer()
                        //next section
                        VStack(alignment:.leading){
                            ForEach(10..<19){i in
                                ElectronicScoreboardCard(index:i)
                            }
                        }
                        .padding(.trailing,30)
                    }
                    .padding(.top,50)
                    .scaleEffect(0.82)
                }
        } .offset(x: -1 * screenWidth * 0.28, y: screenWidth * 0.025)
    }

}




#Preview {
    AufbaIntegerationView(selectedElement: 102)
}
