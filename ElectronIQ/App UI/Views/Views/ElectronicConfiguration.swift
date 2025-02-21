//
//  ElectronicConfiguration.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 12/11/24.
//

import SwiftUI
import FirebaseAnalytics
struct ElectronicConfiguration: View {
    @State private var timer: Timer? = nil
    @State var selectedElement: Int
    @State private var isDrawerOpen = false
    @State private var selectedTab = "K" // Default to "K"
    @State private var isBouncing = false // Controls the bounce effect for the selected button
    @State private var isOpcitiesController:[Bool] = Array(repeating: true, count: 7)
    @State var Index:Int = 0
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
                // Backgrounds and atomic structure rendering
                AppBackground()
                viewBackgroundColor()
                Group{
                    HStack(spacing:50){
                        VStack(spacing:-20){
                            contentHeader(content: "Bohr Model")
                                .zIndex(1)
                                .scaleEffect(1.3)
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.atomBackground)
                                .frame(width:isIPhone ? screenWidth * 0.475:screenWidth * 0.45, height:isIPhone ? screenWidth * 0.4:screenWidth * 0.35)
                                .overlay{
                                    renderAtomStructure(opacityController:$isOpcitiesController, selectedElement: $selectedElement)
                                   
                                }
                            HStack {
                                ForEach(0..<nonZeroGetShellElectronData(selectedElement: selectedElement).count, id: \.self) { shell in
                                    SubShellButton(key: shellSymbols[shell], index: shell)
                                        .opacity(isOpcitiesController[shell] ? 1:0.7)
                                }
                            }
                            .scaleEffect(1.2)
                        }
                        //finished electronic configuration
                        VStack(spacing:-20){
                            contentHeader(content: "\(selectedTab) Sub Shell")
                                .zIndex(1)
                                .scaleEffect(1.3)
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.atomBackground)
                                .frame(width:isIPhone ? screenWidth * 0.475:screenWidth * 0.45, height:isIPhone ? screenWidth * 0.4:screenWidth * 0.35)
                                .overlay(alignment:.bottom){
                                    spdfBoard
                                        .padding(.bottom,isIPhone ? 15:20)
                                }
                                .overlay{
                                    switch selectedTab {
                                    case "L":
                                        LShell(selectedElement: selectedElement) .scaleEffect(0.8)
                                    case "M":
                                        MShell(selectedElement: selectedElement)
                                            .scaleEffect(0.8)
                                    case "N":
                                        NShell(selectedElement: selectedElement)
                                            .scaleEffect(0.7)
                                    case "O":
                                        OShell(selectedElement: selectedElement)
                                            .scaleEffect(0.7)
                                    case "P":
                                        PShell(selectedElement: selectedElement)
                                            .scaleEffect(0.8)
                                    case "Q":
                                        QShell(selectedElement: selectedElement)
                                            .scaleEffect(0.8)
                                    default:
                                        KShell(selectedElement: selectedElement)
                                            .scaleEffect(0.8)
                                    }
                                    
                                    
                                }
                            //shell buttons
                            

                        }
                        .offset(y:-1 * screenWidth * 0.015)
                    }
                }
                .scaleEffect(isIPhone ? 0.7:0.8)
                .offset(y:screenWidth*0.03)
                Header(content: "\(elementsNames[selectedElement]) - \(elementsNumber[selectedElement])", selectedElement: selectedElement)
                HStack(spacing:isIPhone ? screenWidth * 0.575:screenWidth * 0.65) {
                    ElementNavigatorLeft(selectedElement: $selectedElement)
                    ElementNavigatorRight(selectedElement: $selectedElement)
                }
                
                .scaleEffect(1.3)
                .offset(y:screenWidth * 0.03)

                
                
            }
            .onAppear {
                opacityController()
                startTimer()
                
            }
            .onDisappear{
                stopTimer()
            }
           
            .blur(radius:isDrawerOpen ? 3:0)
            .onAppear {
                // Trigger the initial bounce effect
                withAnimation(.easeInOut(duration: 1)) {
                    isBouncing = true
                }
                Analytics.logEvent("Electronic_Configuration_View_Appeared", parameters: ["electronic_configuration":"ElectronicConfigurationView"])
                print("periodic_Table_view_appeared")
            }
            .overlay {
                Button(action: {dismiss()}, label: {BouncingBackButton(selectedElement: selectedElement)})
                    .scaleEffect(isIPhone ? 0.6:1)
                    .offset(x:isIPhone ? -1 * screenWidth * 0.4:-1 * screenWidth * 0.375,y:isIPhone ? -1 * screenWidth * 0.17:-1 * screenWidth * 0.3)
                // Drawer and header overlay
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
        
        .navigationBarBackButtonHidden(true)
    }
    
    /// SubShellButton view for each shell
    @ViewBuilder
    func SubShellButton(key: String, index: Int) -> some View {
        Button(action: {
            // Update the selected tab when button is tapped
            
            selectedTab = key
            Index = index
            stopTimer()
            opacityController()
            // Restart the bounce animation for the new selection
            withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                isBouncing = true
            }
        }) {
            RoundedRectangle(cornerRadius: 10)
                .fill(shellColors[index]) // Button color based on shell
                .frame(width: screenWidth * 0.045, height: screenWidth * 0.045)
                .overlay {
                    Text(key)
                        .font(.custom(atomSymbolFont, size: 18))
                        
                    Text("\(getShellElectronData(selectedElement: selectedElement)[index])")
                        .font(.custom(atomSymbolFont, size: 10))
                        .offset(x:10,y:-10)
                }
        }
        .shadow(
            color: selectedTab == key ? shellColors[index] : .clear, // Shadow only for selected tab
            radius: selectedTab == key ? 10 : 0 // Apply shadow dynamically
        )
        .scaleEffect(selectedTab == key && isBouncing ? 1.2 : 1) // Bounce effect only for selected button
        .animation(.easeInOut(duration: 0.5), value: selectedTab) // Smooth shadow and scale transition
        .foregroundStyle(contentFontColor)
    }
        
    
    /// Header view for content
    @ViewBuilder
    func contentHeader(content: String) -> some View {
        Text(content)
            .padding()
            .frame(width: 200, height: 50)
            
            .font(.custom(headerFont, size: 14))
            .background(elementCardColor[selectedElement])
            .cornerRadius(10)
            .foregroundStyle(contentFontColor)
    }
    @ViewBuilder
    func spdfScoreBoard(index: Int) -> some View {
        let subshellConfig = subshellConfiguration(for: selectedElement)
        let subshellRow = subshellConfig[index]
        
        HStack {
            ForEach(0..<subshellRow.count, id: \.self) { i in
                let subshellValue = subshellRow[i]
                let color = subshellValue == 0 ? Color.gray : spdfColors[i]
                
                Capsule()
                    .fill(color)
                    .frame(width: screenWidth * 0.05, height: screenWidth * 0.025)
                    .overlay {
                        HStack(spacing: 0) {
                            Text("\(spdfNumber[index])\(spdfSymbols[i].lowercased())")
                                .font(.custom(atomSymbolFont, size: isIPhone ? 13 : 14))
                            Text("\(subshellValue)")
                                .font(.custom(atomSymbolFont, size: isIPhone ? 12 : 13))
                                .offset(y: -5)
                        }
                    }
            }
        }
        .foregroundColor(contentFontColor)
    }

    private func opacityController(){
        for i in 0..<isOpcitiesController.count{
            isOpcitiesController[i] = (i == Index)
        }
    }
    
    private func startTimer() {
        guard !nonZeroGetShellElectronData(selectedElement: selectedElement).isEmpty else { return }
        
        timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { _ in
            let maxIndex = nonZeroGetShellElectronData(selectedElement: selectedElement).count - 1
            Index = min((Index + 1), maxIndex) // Ensure Index stays within bounds
            selectedTab = shellSymbols[Index]
            opacityController()
            print("Selected Tab Updated: \(selectedTab)")
        }
    }


    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    var spdfBoard:some View {
        ZStack{
            Capsule().stroke(elementCardColor[selectedElement],style: StrokeStyle(lineWidth: 2)).frame(width:screenWidth * 0.3,height:screenWidth * 0.055)
                .overlay(alignment:.top){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).fill(.atomBackground).frame(width:screenWidth * 0.15,height:screenWidth * 0.02)
                        RoundedRectangle(cornerRadius: 10).stroke(elementCardColor[selectedElement],style: StrokeStyle(lineWidth: 2)).frame(width:screenWidth * 0.15,height:screenWidth * 0.02)
                        
                            .overlay{
                                Text("\(selectedTab) Sub Shell")
                                    .font(.custom(atomSymbolFont, size:isIPhone ? 12:14))
                                    .foregroundColor(.darkBlack)
                            }
                            
                    }
                    .offset(y:-10)
                }
            spdfScoreBoard(index: Index)
              
        }

    }
}

struct previewProviderForElectronicConfiguration:PreviewProvider{
    static var previews: some View{
        ElectronicConfiguration(selectedElement: 4)
    
    }
}
