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
    @State var Index:Int = 0
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
                // Backgrounds and atomic structure rendering
                AppBackground()
                viewBackgroundColor(selectedElement: selectedElement)
                Group{
                    HStack(spacing:50){
                        VStack(spacing:-20){
                            contentHeader(content: "Electronic Configuration")
                                .zIndex(1)
                                .scaleEffect(1.3)
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.atomBackground)
                                .frame(width:isIPhone ? screenWidth * 0.475:screenWidth * 0.45, height:isIPhone ? screenHeigth * 0.4:screenHeigth * 0.35)
                                .overlay{
                                    renderAtomStructure(selectedElement: selectedElement)
                                }
                        }
                        //finished electronic configuration
                        VStack(spacing:-20){
                            contentHeader(content: "\(selectedTab) Sub Shell")
                                .zIndex(1)
                                .scaleEffect(1.3)
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.atomBackground)
                                .frame(width:isIPhone ? screenWidth * 0.475:screenWidth * 0.45, height:isIPhone ? screenHeigth * 0.4:screenHeigth * 0.35)
                                .overlay{
                                    switch selectedTab {
                                    case "L":
                                        LShell(selectedElement: selectedElement)
                                    case "M":
                                        MShell(selectedElement: selectedElement)
                                    case "N":
                                        NShell(selectedElement: selectedElement)
                                    case "O":
                                        OShell(selectedElement: selectedElement)
                                    case "P":
                                        PShell(selectedElement: selectedElement)
                                    case "Q":
                                        QShell(selectedElement: selectedElement)
                                    default:
                                        KShell(selectedElement: selectedElement)
                                    }
                                }
                            //shell buttons
                            HStack {
                                ForEach(0..<nonZeroGetShellElectronData(selectedElement: selectedElement).count, id: \.self) { shell in
                                    SubShellButton(key: shellSymbols[shell], index: shell)
                                }
                            }
                            .scaleEffect(1.2)

                        }
                        .offset(y:screenHeigth * 0.007)
                    }
                }
                .scaleEffect(isIPhone ? 0.8:1)
                .offset(y:screenHeigth*0.03)
                Header(content: "\(elementsNames[selectedElement]) - \(elementsNumber[selectedElement])", selectedElement: selectedElement)
               

                
                
            }
            .onAppear {
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
                    .offset(x:isIPhone ? -1 * screenWidth * 0.4:-1 * screenWidth * 0.375,y:isIPhone ? -1 * screenHeigth * 0.17:-1 * screenHeigth * 0.3)
                // Drawer and header overlay
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
        
        .navigationBarBackButtonHidden(true)
    }
    
    /// SubShellButton view for each shell
    @ViewBuilder
    func SubShellButton(key: String, index: Int) -> some View {
        Button(action: {
            // Update the selected tab when button is tapped
            
            selectedTab = key
            Index = index
            // Restart the bounce animation for the new selection
            withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                isBouncing = true
            }
        }) {
            RoundedRectangle(cornerRadius: 10)
                .fill(shellColors[index]) // Button color based on shell
                .frame(width: screenWidth * 0.04, height: screenWidth * 0.04)
                .overlay {
                    Text(key)
                        .font(.custom(atomSymbolFont, size: 18))
                        .foregroundStyle(.white)
                }
        }
        .shadow(
            color: selectedTab == key ? shellColors[index] : .clear, // Shadow only for selected tab
            radius: selectedTab == key ? 10 : 0 // Apply shadow dynamically
        )
        .scaleEffect(selectedTab == key && isBouncing ? 1.2 : 1) // Bounce effect only for selected button
        .animation(.easeInOut(duration: 0.5), value: selectedTab) // Smooth shadow and scale transition
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
    
    private func startTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { _ in
            Index = (Index + 1) % shellSymbols.count
            selectedTab = shellSymbols[Index]
            print("Selected Tab Updated: \(selectedTab)")
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    ElectronicConfiguration(selectedElement: 102)
}
