//
//  AufbaPrinciple.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 14/11/24.
//

import SwiftUI
import FirebaseAnalytics
import SwiftUI

import SwiftUI

struct AufbaPrinciple: View {
    @Binding var selectedElement: Int

    @State private var isAppearFlags = Array(repeating: false, count: 19)
    @State private var isBumbingFlags = Array(repeating: false, count: 19)
    
    @State private var timer: Timer? // Store reference to timer

    let spacing: CGFloat = 5

    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            HStack(spacing: spacing) {
                AufbaElementCard(content: content[0], color: spdfColors[0], isColor: $isAppearFlags[0], isBumping: $isBumbingFlags[0], index: 0)
            }
            HStack(spacing: spacing) {
                ForEach(0..<2, id: \.self) { sub in
                    AufbaElementCard(content: "\(content[sub+1])", color: spdfColors[sub], isColor: $isAppearFlags[sub+1], isBumping: $isBumbingFlags[sub+1], index: sub)
                }
            }
            HStack(spacing: spacing) {
                ForEach(0..<3, id: \.self) { sub in
                    AufbaElementCard(content: "\(content[sub+3])", color: spdfColors[sub], isColor: $isAppearFlags[sub+3], isBumping: $isBumbingFlags[sub+3], index: sub)
                }
            }
            HStack(spacing: spacing) {
                ForEach(0..<4, id: \.self) { sub in
                    AufbaElementCard(content: "\(content[sub+6])", color: spdfColors[sub], isColor: $isAppearFlags[sub+6], isBumping: $isBumbingFlags[sub+6], index: sub)
                }
            }
            HStack(spacing: spacing) {
                ForEach(0..<4, id: \.self) { sub in
                    AufbaElementCard(content: "\(content[sub+10])", color: spdfColors[sub], isColor: $isAppearFlags[sub+10], isBumping: $isBumbingFlags[sub+10], index: sub)
                }
            }
            HStack(spacing: spacing) {
                ForEach(0..<3, id: \.self) { sub in
                    AufbaElementCard(content: "\(content[sub+14])", color: spdfColors[sub], isColor: $isAppearFlags[sub+14], isBumping: $isBumbingFlags[sub+14], index: sub)
                }
            }
            HStack(spacing: spacing) {
                ForEach(0..<2, id: \.self) { sub in
                    AufbaElementCard(content: "\(content[sub+17])", color: spdfColors[sub], isColor: $isAppearFlags[sub+17], isBumping: $isBumbingFlags[sub+17], index: sub)
                }
            }
        }
        .onAppear {
            resetAnimationWithTimer()
        }
        .onChange(of: selectedElement) { _ in
            
            resetAnimationWithTimer()
        } // Ensures animation resets only once when `selectedElement` changes
    }

    /// **Resets the animation flags and restarts the animation using a timer**
    func resetAnimationWithTimer() {
        timer?.invalidate() // Stop the previous timer before starting a new one
        timer = nil

        // Immediately reset animation flags to clear any lingering animations
        isAppearFlags = Array(repeating: false, count: 19)
        isBumbingFlags = Array(repeating: false, count: 19)
        animateElementCardWithTimer()
    }




    /// **Removes trailing zeros from electronic configuration**
    func removeZeros(selectedElement: Int) -> [Int] {
        let processArray: [Int] = electronicConfiguration[selectedElement]
        guard let lastNonZeroIndex = processArray.lastIndex(where: { $0 != 0 }) else {
            return []
        }
        return Array(processArray[...lastNonZeroIndex])
    }

    /// **Animates each subshell one by one using a Timer**
    func animateElementCardWithTimer() {
    
        let APRFilledSubShells: [Int] = [2, 2, 6, 2, 6, 10, 2, 6, 10, 14, 2, 6, 10, 14, 2, 6, 10, 2, 6]
        let elementConfig = electronicConfiguration[selectedElement]
        let countOfSubShells = removeZeros(selectedElement: selectedElement).count

        var index = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if index >= APR.count || index >= countOfSubShells {
                timer.invalidate() // Stop when done
                self.timer = nil
                return
            }

            let i = APR[index]
            if elementConfig[i] != 0 {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isAppearFlags[i] = true
                }

                if APRFilledSubShells[i] != elementConfig[i] {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isBumbingFlags[i] = true
                    }
                }
            }
            
            index += 1
        }
    }
}


////withAnimation(.easeInOut(duration: 0.5)) {
//isBumbingFlags[i] = true
//}
struct AufbaElementCard: View {
    var content: String
    var color: Color
    @Binding var isColor: Bool
    @Binding var isBumping: Bool
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
    @State private var timer: Timer?
    @Environment(\.dismiss) var dismiss
    var body: some View{
        NavigationStack{
            ZStack{
                AppBackground()
                viewBackgroundColor()
                Header(content: "\(elementsNames[selectedElement]) - \(elementsNumber[selectedElement])", selectedElement: selectedElement)
                HStack(spacing:isIPhone ? screenWidth * 0.1:screenWidth * 0.12){
                    ElectronicScoreboard(selectedElement: selectedElement)
                    AufbaPrinciple(selectedElement: $selectedElement)
                        .scaleEffect(isIPhone ? 1:1.3)
                    incrementerSideBar()
                }
                .scaleEffect(0.9)
                .offset(y:screenWidth * 0.025)
                HStack(spacing:isIPhone ? screenWidth * 0.575:screenWidth * 0.65) {
                    ElementNavigatorLeft(selectedElement: $selectedElement)
                    ElementNavigatorRight(selectedElement: $selectedElement)
                }
                .onChange(of: selectedElement) { newValue in
                    incrementer = 0  // Reset counter
                    animateIncrementer() // Restart animation
                }
                .scaleEffect(1.3)
                .offset(y:screenWidth * 0.03)
                
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
//        .offset(x:screenWidth * 0.25)
    }
    func animateIncrementer() {
        timer?.invalidate() // Stop any existing timer to prevent double counting
        incrementer = 0  // Reset incrementer before starting animation
        
        var index = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { t in
            if index < electronicConfiguration[selectedElement].count {
                withAnimation(.easeInOut) {
                    incrementer += electronicConfiguration[selectedElement][APR[index]]
                }
                index += 1
            } else {
                t.invalidate() // Stop timer when all increments are done
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
        }
//        .offset(x: -1 * screenWidth * 0.28, y: screenWidth * 0.025)
    }

}




#Preview {
    AufbaIntegerationView(selectedElement: 10)
}
