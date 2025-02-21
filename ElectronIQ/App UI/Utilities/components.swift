//
//  components.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 08/11/24.
//

import SwiftUI
//miniature atom view -> finished
//atom View -> finished
// Drawer menu -> finished
@ViewBuilder
func viewBackgroundColor() -> some View {
    @Environment(\.colorScheme) var colorScheme
    
    Color.darkGrey.opacity(colorScheme == .light ? 0.5 : 0)
        .edgesIgnoringSafeArea(.all)
}
@ViewBuilder
func Drawer(isDrawerOpen:Bool)->some View{
    ZStack{
        RoundedRectangle(cornerRadius: 10)
            .fill(.gray).opacity(0.8)
            .frame(width: screenWidth*0.3)
        
            .edgesIgnoringSafeArea(.all)
            .overlay{
                VStack(alignment:.leading,spacing:15){
                    ForEach(0..<4,id: \.self){ menuView in
                        NavigationLink(destination: getMenuView(at: menuView), label: {
                            Text(menuViewsTitles[menuView])
                                .font(.custom(titleFont, size: 18))
                                .padding(.leading,50)
                        })
                    }
                }
            }
            .foregroundColor(drawerContentColor)
            .overlay(alignment:.bottomTrailing){
                    VersionView()
            }
            .offset(x:isDrawerOpen ? (-1*screenWidth*0.4):(-1*screenWidth*0.7))
    }
}

@ViewBuilder
func drawerButton(isDrawerOpen:Binding<Bool>)->some View{
    Button(action: {
        isDrawerOpen.wrappedValue.toggle()
    }, label: {
        VStack(spacing: 6) {
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 30, height: 3)
                .rotationEffect(isDrawerOpen.wrappedValue ? Angle(degrees: 45) : .zero)
                .offset(y: isDrawerOpen.wrappedValue ? 9 : 0)
            
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 30, height: 3)
                .opacity(isDrawerOpen.wrappedValue ? 0 : 1)
            
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 30, height: 3)
                .rotationEffect(isDrawerOpen.wrappedValue ? Angle(degrees: -45) : .zero)
                .offset(y: isDrawerOpen.wrappedValue ? -9 : 0)
        }
        .animation(.easeIn, value: isDrawerOpen.wrappedValue)
        .foregroundColor(isDrawerOpen.wrappedValue ? .white:.darkGrey)
    })
    .scaleEffect(isIPhone ? 1:1.5)
    .offset(x:-1 * screenWidth*0.45,y:isIPhone ? -1 * screenWidth*0.17: -1 * screenWidth*0.3)
    
}
//########################################################
@ViewBuilder
func Header(content:String,selectedElement:Int)->some View{
    var headerOffset: CGFloat {
        if isIPhone {
            print("iphone")
            return -screenWidth * 0.21
        } else if screenWidth == 1180.0{
            print("11 inch")
            return -screenWidth * 0.325
        } else if screenWidth == 1366.0{
            print("13 inch")
            return -screenWidth * 0.35
        } else {
            print("mytab")
            return -screenWidth * 0.365
            
        }
    }
    @Environment(\.colorScheme) var colorScheme
    if content == ""{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(.headerBackground).opacity(0.9)
                .frame(width:screenWidth * 0.5,height: screenWidth * 0.07)
            
                .edgesIgnoringSafeArea(.all)
              
            Text("Periodic Table")
                .font(.custom(headerFont, size:isIPhone ? 24 : 36))
                .offset(y:screenWidth * 0.012)
//                .foregroundColor(.white)
                .foregroundColor(Color.headerFont)
                .bold()
        }
        .scaledToFit()
        .offset(y:headerOffset)
    }else{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(elementCardColor[selectedElement]).opacity(0.9)
                .frame(width:screenWidth * 0.5,height:screenWidth * 0.07)
            
                .edgesIgnoringSafeArea(.all)
            
            Text(content)
                .font(.custom(headerFont, size:isIPhone ? 24 : 36))
                .offset(y:screenWidth * 0.012)
//                .foregroundColor(.white)
                .foregroundColor(HeaderFontColor)
            
        }
        .scaledToFit()
        

        .offset(y:headerOffset)
    }
}

//#####################################################################################################################
struct ClockWiseAtomShell: View {
    let numberOfBalls: Int  // The number of balls to display
    let radius: CGFloat     // Radius of the circular arrangement
    let color:Color
    @State var isHibirnateShell = false
    // Track the rotation angle
    @State private var angle: CGFloat = 0
    
    // Timer to update the angle
    @State private var timer: Timer? = nil
    
    var body: some View {
        ZStack {
            // Calculate the center of the circular arrangement
            Circle()
                .stroke(isHibirnateShell ? .gray:color,lineWidth: 2)
                .frame(width:radius*2)
                .shadow(color:isHibirnateShell ? .clear:color,radius: 10)
                
            ForEach(0..<numberOfBalls, id: \.self) { index in
                // Calculate the initial angle offset for each ball
                let angleOffset = 2 * .pi * CGFloat(index) / CGFloat(numberOfBalls)
                
                // Calculate the x and y positions based on the angle and radius
                let xPosition = radius * cos(angle + angleOffset)
                let yPosition = radius * sin(angle + angleOffset)
                
                // Create a circle (ball) and position it based on the calculated coordinates
                Circle()
                    .frame(width: 7)
                    .offset(x: xPosition, y: yPosition)
                    .foregroundColor(isHibirnateShell ? .gray:.red) // Ball color
            }
        }
        .onAppear {
            // Start the animation timer when the view appears
            if !isHibirnateShell{
                startAnimation()
            }
        }
        .onDisappear {
            // Invalidate the timer when the view disappears
            
                timer?.invalidate()
            
        }
    }
    
    private func startAnimation() {
        // Create and store the timer reference
        let newTimer = Timer(timeInterval: 1/60, repeats: true) { _ in
            withAnimation(.linear(duration: 0)) {
                angle += 0.01
            }
        }
        
        RunLoop.current.add(newTimer, forMode: .common)
        timer = newTimer  // Store the timer reference
    }
    
    private func stopAnimation() {
        timer?.invalidate()
        timer = nil
    }
}
//#####################################################################################################################


//#####################################################################################################################


struct AntiClockWiseAtomShell: View {
    let numberOfBalls: Int
    let radius: CGFloat
    let color:Color
    @State private var angle: CGFloat = 0
    @State private var timer: Timer?
    @State var isHibirnateShell = false
    
    var body: some View {
        ZStack {
            // Calculate the center of the circular arrangement
            Circle()
                .stroke(isHibirnateShell ? .gray:color,lineWidth: 2)
                .frame(width:radius*2)
                
            ForEach(0..<numberOfBalls, id: \.self) { index in
                // Calculate the initial angle offset for each ball
                let angleOffset = 2 * .pi * CGFloat(index) / CGFloat(numberOfBalls)
                
                // Calculate the x and y positions based on the angle and radius
                let xPosition = radius * cos(angle + angleOffset)
                let yPosition = radius * sin(angle + angleOffset)
                
                // Create a circle (ball) and position it based on the calculated coordinates
                Circle()
                    .frame(width: 7)
                    .offset(x: xPosition, y: yPosition)
                    .foregroundColor(isHibirnateShell ? .gray:.red) // Ball color
            }
        }
        .onAppear {
            // Start the animation timer when the view appears
            if !isHibirnateShell{
                startAnimation()
            }
        }
        .onDisappear {
            // Invalidate the timer when the view disappears
           
            stopAnimation()
            
        }
    }
    
    private func startAnimation() {
        // Create and store the timer reference
        let newTimer = Timer(timeInterval: 1/60, repeats: true) { _ in
            withAnimation(.linear(duration: 0)) {
                angle -= 0.01
            }
        }
        
        RunLoop.current.add(newTimer, forMode: .common)
        timer = newTimer  // Store the timer reference
    }
    
    private func stopAnimation() {
        timer?.invalidate()
        timer = nil
    }
}


//#####################################################################################################################

struct renderAtomStructure:View {
    @Binding var opacityController:[Bool]
    @Binding var selectedElement:Int
    var body: some View {
        
        
        ZStack {
            Circle()
                .fill(.blue)
                .frame(width: 30)
                .overlay(alignment: .center) {
                    Text("\(elementsSymbols[selectedElement])")
                        .font(.custom(atomSymbolFont, size: 16))
                        .bold()
                        .foregroundColor(.white)
                }
            
            // index0 -> x offset
            // index1 -> y offset
            // index2 -> arrow rotation
            // index3 -> text rotation
            let shellProperties: [[Int]] = [
                [63, -12, -135, 120],
                [39, 10, -165, 110],
                [17, 20, -195, 90],
                [7, 40, -235, 80],
                [130, -20, -30, 70],
                [142, 10, 10, 60],
                [133, 60, 30, 50]
            ]
            
            ForEach(0..<getShellElectronData(selectedElement: selectedElement).count, id: \.self) { index in
                let electrons = getShellElectronData(selectedElement: selectedElement)[index]
                if electrons != 0 {
                    ZStack {
                        if index % 2 == 0 {
                            ClockWiseAtomShell(
                                numberOfBalls: electrons,
                                radius: 20 + CGFloat(index * 15),
                                color: shellColors[index]
                            )
                            .opacity(opacityController[index] ? 1:0.5)
                        } else {
                            AntiClockWiseAtomShell(
                                numberOfBalls: electrons,
                                radius: 20 + CGFloat(index * 15),
                                color: shellColors[index]
                            )
                            
                            .opacity(opacityController[index] ? 1:0.7)
                        }
                        
                        AnimatedArrow(
                            noOfElectron: electrons, color: shellColors[index],
                            arrowRotation: shellProperties[index][2],
                            textRotation: shellProperties[index][2] * -1,
                            arrowWidth: CGFloat(shellProperties[index][3]),
                            shellSymbol: shellSymbols[index]
                        ).shadow(color:shellColors[index],radius:opacityController[index] ?  10:0)
                        .opacity(opacityController[index] ? 1:0.5)
                        .offset(
                            x: CGFloat(shellProperties[index][0]),
                            y: CGFloat(shellProperties[index][1])
                        )
                    }
                }
            }
        }
    }
}

//#################################################################
@ViewBuilder
func renderMiniatureAtomStructure(selectedElement: Int) -> some View {
    ZStack {
        Circle()
            .fill(.blue)
            .frame(width: 30)
            .overlay(alignment:.center){
                Text("\(elementsSymbols[selectedElement])")
                    .font(.custom(atomSymbolFont, size: 16))
                    .bold()
                    .foregroundColor(.white)
            }
        
        ForEach(Array(getShellElectronData(selectedElement: selectedElement).enumerated()), id: \.offset) { index, electrons in
            if index % 2 == 0 && getShellElectronData(selectedElement: selectedElement)[index] != 0 {
                    ClockWiseAtomShell(
                        numberOfBalls: electrons,
                        radius:20 + CGFloat(index * 7),
                        color: shellColors[index]
                    )
            } else if getShellElectronData(selectedElement: selectedElement)[index] != 0 {
                
                AntiClockWiseAtomShell(
                    numberOfBalls: electrons,
                    radius: 20 + CGFloat(index * 7),
                    color: shellColors[index]
                )
            }
        }
    }
    .frame(width:isIPhone ? screenWidth*0.14:screenWidth*0.12,height: isIPhone ? screenWidth*0.14:screenWidth*0.12)
    .scaleEffect(selectedElement < 10 ? 1.5:(selectedElement < 20 ? 1.2:(selectedElement < 30 ? 1.1:(selectedElement < 60 ? 1:0.9))))
}

//####################################################################################################
//section -> basic particles of an atom
struct ScalableImageView: View {
    let imgName: String
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        Image(imgName)
            .resizable()
            .frame(width:isIPhone ? screenWidth*0.14:screenWidth*0.12,height: isIPhone ? screenWidth*0.14:screenWidth*0.12)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(scale)
    }
}




@ViewBuilder
func renderElementCard(selectedElement:Int)->some View{
    
    ZStack{
        RoundedRectangle(cornerRadius: 10)
            .fill(.whiteFont)
            .frame(width:isIPhone ? screenWidth*0.14:screenWidth*0.12,height: isIPhone ? screenWidth*0.14:screenWidth*0.12)
        Text(elementsSymbols[selectedElement])
            .font(.custom(atomSymbolFont, size: 32))
            .foregroundColor(elementCardColor[selectedElement])
    }
    .overlay(alignment: .bottom){
        Text(elementsNames[selectedElement])
            .font(.custom(atomSymbolFont, size: 18))
            .foregroundColor(elementCardColor[selectedElement])
            .padding(.bottom,10)
    }
    .overlay(alignment: .topLeading){
        Text("\(elementsNumber[selectedElement])")
            .font(.custom(atomSymbolFont, size: 18))
            .foregroundColor(elementCardColor[selectedElement])
            .padding([.top,.leading],5)
    }
    .overlay(alignment: .topTrailing){
        Text("\(elementsMassNo[selectedElement], specifier: "%.1f")")
            .font(.custom(atomSymbolFont, size: 18))
            .foregroundColor(elementCardColor[selectedElement])
            .padding([.top,.trailing],5 )
    }
}
@ViewBuilder
func renderBasicParticlesOfAnAtom(selectedElement:Int) -> some View{
    ZStack{
        
        RoundedRectangle(cornerRadius: 10)
            .fill(elementCardColor[selectedElement])
            .frame(width: screenWidth * 0.3,height: screenWidth * 0.2)
            .overlay(alignment:.top){
                VStack{
                    Text("Basic particles of an atom")
                        .font(.custom(atomSymbolFont, size: 16))
                        .padding(.top,isIPhone ? 10:15)
                    Divider()
                        .frame(width:screenWidth*0.3,height: 2)
                        .overlay(.blackFont)
                }
            }
        
        let datas:[String] = ["Protons","Neutrons","Electrons"]
        let PNEdata = [elementsNumber,neutrons,elementsNumber]
        ZStack{
            Group{
                    ZStack{
                        RoundedRectangle(cornerRadius: CGFloat(10))
                            .fill(.atomBackground)
                            .frame(width:isIPhone ? screenWidth*0.14:screenWidth*0.12,height: isIPhone ? screenWidth*0.14:screenWidth*0.12)
                        renderMiniatureAtomStructure(selectedElement: selectedElement)
                          
                            
                    }
            }
            .offset(x:-1*screenWidth*0.07)
            Group{
                VStack(alignment: .leading){
                    ForEach(0..<datas.count,id: \.self){data in
                        HStack{
                            Text(datas[data])
                            Spacer()
                            Text("\(PNEdata[data][selectedElement])")
                        }.frame(width: 100, height: 10, alignment: .center)
                            .font(.custom(atomSymbolFont, size:isIPhone ? 13:14))
                            .padding(.all,2)
                    }
                }
            }
            .offset(x:1*screenWidth*0.08)
        }
        .offset(y:screenWidth*0.02)
        .foregroundColor(contentFontColor)
        
    }
}
@ViewBuilder
func elementDetailTableView(selectedElement: Int) -> some View {
    RoundedRectangle(cornerRadius: 10) // Step 1: Create Rounded Rectangle
        .fill(elementCardColor[selectedElement]) // Fill color for the rounded rectangle
        .frame(width: screenWidth * 0.3, height: screenWidth * 0.2) // Adjusted height for better spacing
        .overlay(
            VStack {
                VStack{
                    Text("Element Detail")
                        .font(.custom(atomSymbolFont, size: 16))
                    
                    Divider()
                        .frame(width: screenWidth * 0.3, height: 2)
                        .background(Color.black)
                }
                .offset(y:-1 * screenWidth * 0.0075)
                
                ScrollView(showsIndicators: true) {
                    VStack(spacing: 5) { // Content inside ScrollView
                        let headings: [String] = [
                            "Element Name","Common Name", "Element Symbol",  "Period", "Block",
                            "Electronic Configuration", "Melting Point", "Density", "Oxidation State","Group"
                        ]
                        
                        let content = [
                            elementsNames,CommonNames, elementsSymbols, periods, blocks,
                            electronicConfigurationContents, meltingPoints, densities, oxidationStates, groups
                        ]
                        
                        ForEach(headings.indices, id: \.self) { index in
                            HStack(alignment: .top, spacing: 10) { // Added spacing for better readability
                                Text(headings[index])
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("\(content[index][selectedElement])")
                                    .frame(maxWidth: .infinity, alignment: .leading) // Ensure leading alignment
                                    .multilineTextAlignment(.leading) // Support multiline leading alignment
                            }
                            .font(.custom(atomSymbolFont, size: isIPhone ? 14 : 16))
                            
                            Divider()
                                .frame(width: screenWidth * 0.27)
                                .background(Color.gray)
                        }
                    }
                    .frame(width: screenWidth * 0.27) // Removed fixed height to allow natural expansion
                    .padding()
                }
                .offset(y:-1*screenWidth*0.01)
            }
            .padding() // Padding around the VStack inside overlay
                
        )
        .foregroundColor(contentFontColor)
        .padding() // Outer padding for overall spacing
}

//######################################################################################
struct BouncingButton<Destination: View>: View {
    let buttonContent: String
    let selectedElement: Int
    let destination: Destination
    
    @State private var isBouncing = false
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(buttonContent)
                .padding()
                .font(.custom(atomSymbolFont, size: 16)) // Replace with your font name
                .frame(width: screenWidth * 0.3)
                .foregroundColor(contentFontColor) // Replace with your actual color
                .background(elementCardColor[selectedElement]) // Replace with your actual color array
                .cornerRadius(8)
                .scaleEffect(isBouncing ? 1 : 0.9) // Scale effect for bouncing
                .shadow(color:elementCardColor[selectedElement],radius: isBouncing ? 5 : 0)
                .onAppear {
                    // Start the bouncing animation
                    withAnimation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                        isBouncing.toggle()
                    }
                }
        }
    }
}
struct BouncingLink:View {
    let buttonContent: String
    let selectedElement: Int
    
    @State private var isBouncing = false
    var body: some View {
        Link(destination: URL(string: elementUsesVediosLink[selectedElement])!, label: {
            Text(buttonContent)
                .padding()
                .font(.custom(atomSymbolFont, size: 16)) // Replace with your font name
                .frame(width: screenWidth * 0.3)
                .foregroundColor(contentFontColor) // Replace with your actual color
                .background(elementCardColor[selectedElement]) // Replace with your actual color array
                .cornerRadius(8)
                .scaleEffect(isBouncing ? 1 : 0.9) // Scale effect for bouncing
                .shadow(color:elementCardColor[selectedElement],radius: isBouncing ? 5 : 0)
                .onAppear {
                    // Start the bouncing animation
                    withAnimation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                        isBouncing.toggle()
                    }
                }
        })
    }
}
@ViewBuilder
func renderValanceElectron(selectedElement:Int)->some View{
   
    VStack(){
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(.atomBackground)
                .frame(width:isIPhone ? screenWidth*0.14:screenWidth*0.12,height: isIPhone ? screenWidth*0.14:screenWidth*0.12)
            Circle()
                .fill(.blue)
                .frame(width: 30)
                .overlay(alignment:.center){
                    Text("\(elementsSymbols[selectedElement])")
                        .font(.custom(atomSymbolFont, size: 16))
                        .bold()
//                        .foregroundColor(.white)
                }
            ClockWiseAtomShell(numberOfBalls: valanceShellElectrons[selectedElement], radius: 50, color: .black)
        }
        .offset(y:screenWidth * 0.02)
        
    }
    .frame(width: screenWidth * 0.3,height: screenWidth * 0.2)
    .background(elementCardColor[selectedElement])
    .cornerRadius(10)
    .overlay(alignment:.top){
        VStack{
            Text("Valance Electron")
                        .font(.custom(atomSymbolFont, size: 16))
                        .padding(.top,isIPhone ? 10:15)
            Divider()
                .frame(width:screenWidth*0.3,height: 2)
                .overlay(.blackFont)
        }
    }

    .padding()
}

@ViewBuilder
func renderNavigationButtons(selectedElement:Int)->some View{
    VStack(spacing:isIPhone ? screenWidth*0.01 : screenWidth * 0.025){
        BouncingButton(buttonContent: "Bohr Model", selectedElement: selectedElement, destination: ElectronicConfiguration(selectedElement: selectedElement))
        BouncingButton(buttonContent: "Aufbau Principle", selectedElement: selectedElement, destination: AufbaIntegerationView(selectedElement: selectedElement))
        BouncingLink(buttonContent: "Watch and Learn", selectedElement: selectedElement)
    }
    .frame(width: screenWidth * 0.3,height: screenWidth * 0.2)
}

@ViewBuilder
func nucleusElectron(selectedElement:Int)->some View{
    ZStack{
        Circle()
            .fill(.blue)
            .frame(width: 30)
            .overlay(alignment:.center){
                Text("\(elementsSymbols[selectedElement])")
                    .font(.custom(atomSymbolFont, size: 16))
                    .bold()
                   .foregroundStyle(contentFontColor)
            }
    }
}

struct KShell:View {
    @State var selectedElement:Int
    var body: some View {
        ZStack{
            nucleusElectron(selectedElement: selectedElement)
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[0][0], radius: 30, color: spdfColors[0])
            AnimatedArrow(noOfElectron:subshellConfiguration(for: selectedElement)[0][0],color: spdfColors[0], arrowRotation: 220, textRotation: -220, arrowWidth: 100, shellSymbol: "S")
                .offset(x:45, y: -20)
           
        }
        .background{
            
            ForEach(1..<7,id: \.self){index in
                if getShellElectronData(selectedElement: selectedElement)[index] != 0 {
                    if index %  2 == 0{
                        ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(30 + index * 10), color: .red,isHibirnateShell: true)
                    }else{
                        AntiClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(30 + index * 10), color: .red,isHibirnateShell: true)
                    }
                }
            }
        }
    }
}

struct LShell:View {
    @State var selectedElement:Int
    var body: some View {
        ZStack{
            nucleusElectron(selectedElement: selectedElement)
            ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[0], radius: CGFloat(30), color: .red,isHibirnateShell: true)
           
            //s
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[1][0], radius: 40, color:subshellConfiguration(for: selectedElement)[1][0] == 0 ? .gray : spdfColors[0])
            AnimatedArrow(noOfElectron:subshellConfiguration(for: selectedElement)[1][0],color:subshellConfiguration(for: selectedElement)[1][0] == 0 ? .gray : spdfColors[0], arrowRotation: 220, textRotation: -220, arrowWidth: 100, shellSymbol: "S")
                           .offset(x:35, y: -20)
            //p
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[1][1], radius: 55, color: subshellConfiguration(for: selectedElement)[1][1] == 0 ? .gray : spdfColors[1])
            AnimatedArrow(noOfElectron:subshellConfiguration(for: selectedElement)[1][1],color: subshellConfiguration(for: selectedElement)[1][1] == 0 ? .gray : spdfColors[1], arrowRotation: 320, textRotation: -320, arrowWidth: 100, shellSymbol: "P")
                            .offset(x:120, y: -20)
        }
        .background{
            //continue
            ForEach(2..<7,id: \.self){index in
                if getShellElectronData(selectedElement: selectedElement)[index] != 0 {
                    if index %  2 == 0{
                        ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(45 + index * 10), color: .red,isHibirnateShell: true)
                    }else{
                        ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(45 + index * 10), color: .red,isHibirnateShell: true)
                    }
                }
            }
        }
    }
}
struct MShell:View {
    @State var selectedElement:Int
    var body: some View {
        ZStack{
            nucleusElectron(selectedElement: selectedElement)
            ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[0], radius: CGFloat(30), color: .red,isHibirnateShell: true)
            ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[1], radius: CGFloat(40), color: .red,isHibirnateShell: true)
            //s
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[2][0], radius: 55, color:  subshellConfiguration(for: selectedElement)[2][0] == 0 ? .gray : spdfColors[0])
            AnimatedArrow(noOfElectron: subshellConfiguration(for: selectedElement)[2][0], color: subshellConfiguration(for: selectedElement)[2][0] == 0 ? .gray : spdfColors[0], arrowRotation: 220, textRotation: -220, arrowWidth: 120, shellSymbol: "S")
                           .offset(x:30, y: -25)
            //p
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[2][1], radius: 70, color: subshellConfiguration(for: selectedElement)[2][1] == 0 ? .gray : spdfColors[1])
            AnimatedArrow(noOfElectron: subshellConfiguration(for: selectedElement)[2][1], color: subshellConfiguration(for: selectedElement)[2][1] == 0 ? .gray : spdfColors[1], arrowRotation: 320, textRotation: -320, arrowWidth: 120, shellSymbol: "P")
                           .offset(x:135, y: -40)
            //d
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[2][2], radius: 85, color: subshellConfiguration(for: selectedElement)[2][2] == 0 ? .gray : spdfColors[2])
            AnimatedArrow(noOfElectron: subshellConfiguration(for: selectedElement)[2][2], color: subshellConfiguration(for: selectedElement)[2][2] == 0 ? .gray : spdfColors[2], arrowRotation: 140, textRotation: -140, arrowWidth: 100, shellSymbol: "D")
                           .offset(x:-8, y: 40)
            //continue
            ForEach(3..<7,id: \.self){index in
                if getShellElectronData(selectedElement: selectedElement)[index] != 0 {
                    if index %  2 == 0{
                        ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(70 + index * 10), color: .red,isHibirnateShell: true)
                    }else{
                        AntiClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(70 + index * 10), color: .red,isHibirnateShell: true)
                    }
                }
            }
        }
    }
}

struct NShell:View {
    @State var selectedElement:Int
    var body: some View {
        ZStack{
             nucleusElectron(selectedElement: selectedElement)
            ForEach(0..<3,id: \.self){index in
                ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(30 + index * 10), color: .red,isHibirnateShell: true)
            }
            //s
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[3][0], radius: 60, color: subshellConfiguration(for: selectedElement)[3][0] == 0 ? .gray : spdfColors[0])
            AnimatedArrow(noOfElectron:subshellConfiguration(for: selectedElement)[3][0],color: subshellConfiguration(for: selectedElement)[3][0] == 0 ? .gray : spdfColors[0], arrowRotation: 220, textRotation: -220, arrowWidth: 120, shellSymbol: "S")
                           .offset(x:37, y: -45)
            //p
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[3][1], radius: 75, color: subshellConfiguration(for: selectedElement)[3][1] == 0 ? .gray : spdfColors[1])
            AnimatedArrow(noOfElectron:subshellConfiguration(for: selectedElement)[3][1],color:subshellConfiguration(for: selectedElement)[3][1] == 0 ? .gray : spdfColors[1], arrowRotation: 320, textRotation: -320, arrowWidth: 100, shellSymbol: "P")
                           .offset(x:130, y: -40)
            //d
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[3][2], radius: 90, color: subshellConfiguration(for: selectedElement)[3][2] == 0 ? .gray : spdfColors[2])
            AnimatedArrow(noOfElectron:subshellConfiguration(for: selectedElement)[3][2],color: subshellConfiguration(for: selectedElement)[3][2] == 0 ? .gray : spdfColors[2], arrowRotation: 140, textRotation: -140, arrowWidth: 80, shellSymbol: "D")
                           .offset(x:-22, y: 40)
            //f
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[3][3], radius: 105, color: subshellConfiguration(for: selectedElement)[3][3] == 0 ? .gray : spdfColors[3])
            AnimatedArrow(noOfElectron:subshellConfiguration(for: selectedElement)[3][3],color: subshellConfiguration(for: selectedElement)[3][3] == 0 ? .gray : spdfColors[3], arrowRotation: 40, textRotation: -40, arrowWidth: 80, shellSymbol: "F")
                           .offset(x:150, y: 50)
        }
        .background{
            ForEach(4..<7,id: \.self){index in
                if getShellElectronData(selectedElement: selectedElement)[index] != 0 {
                    ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(75 + index * 10), color: .red,isHibirnateShell: true)
                }
            }
        }
    }
}

struct OShell:View {
    @State var selectedElement:Int
    var body: some View {
        ZStack{
             nucleusElectron(selectedElement: selectedElement)
            ForEach(0..<4,id: \.self){index in
                ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(30 + index * 10), color: .red,isHibirnateShell: true)
            }
            //s
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[4][0], radius: 75, color: subshellConfiguration(for: selectedElement)[4][0] == 0 ? .gray : spdfColors[0])
            AnimatedArrow(noOfElectron:subshellConfiguration(for: selectedElement)[4][0],color: subshellConfiguration(for: selectedElement)[4][0] == 0 ? .gray : spdfColors[0], arrowRotation: 220, textRotation: -220, arrowWidth: 120, shellSymbol: "S")
                           .offset(x:25, y: -55)
            //p
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[4][1], radius: 90, color: subshellConfiguration(for: selectedElement)[4][1] == 0 ? .gray : spdfColors[1])
            AnimatedArrow(noOfElectron:subshellConfiguration(for: selectedElement)[4][1],color: subshellConfiguration(for: selectedElement)[4][1] == 0 ? .gray : spdfColors[1], arrowRotation: 320, textRotation: -320, arrowWidth: 100, shellSymbol: "P")
                           .offset(x:143, y: -50)
            //d
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[4][2], radius: 105, color: subshellConfiguration(for: selectedElement)[4][2] == 0 ? .gray : spdfColors[2])
            AnimatedArrow(noOfElectron:subshellConfiguration(for: selectedElement)[4][2],color: subshellConfiguration(for: selectedElement)[4][2] == 0 ? .gray : spdfColors[2], arrowRotation: 140, textRotation: -140, arrowWidth: 80, shellSymbol: "D")
                           .offset(x:-40, y: 40)
            //f
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[4][3], radius: 120, color: subshellConfiguration(for: selectedElement)[4][3] == 0 ? .gray : spdfColors[3])
            AnimatedArrow(noOfElectron:subshellConfiguration(for: selectedElement)[4][3],color: subshellConfiguration(for: selectedElement)[4][3] == 0 ? .gray : spdfColors[3], arrowRotation: 30, textRotation: -40, arrowWidth: 60, shellSymbol: "F")
                           .offset(x:155, y: 50)
        }
        .background{
            ForEach(5..<7,id: \.self){index in
                if getShellElectronData(selectedElement: selectedElement)[index] != 0 {
                    ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(85 + index * 10), color: .red,isHibirnateShell: true)
                }
            }
        }
    }
}

struct PShell:View {
    @State var selectedElement:Int
    var body: some View {
        ZStack{
            nucleusElectron(selectedElement: selectedElement)
            ForEach(0..<5,id: \.self){index in
                if getShellElectronData(selectedElement: selectedElement)[index] != 0 {
                    if index %  2 == 0{
                        ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(30 + index * 10), color: .red,isHibirnateShell: true)
                    }else{
                        ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(30 + index * 10), color: .red,isHibirnateShell: true)
                    }
                }
            }
            
//            ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[0], radius: CGFloat(30), color: .red,isHibirnateShell: true)
//            ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[1], radius: CGFloat(40), color: .red,isHibirnateShell: true)
            //s
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[5][0], radius: 85, color: subshellConfiguration(for: selectedElement)[5][0] == 0 ? .gray : spdfColors[0])
            AnimatedArrow(noOfElectron: subshellConfiguration(for: selectedElement)[5][0], color: subshellConfiguration(for: selectedElement)[5][0] == 0 ? .gray : spdfColors[0], arrowRotation: 220, textRotation: -220, arrowWidth: 90, shellSymbol: "S")
                           .offset(x:-3, y: -55)
            //p
            AntiClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[5][1], radius: 95, color: subshellConfiguration(for: selectedElement)[5][1] == 0 ? .gray : spdfColors[1])
            AnimatedArrow(noOfElectron: subshellConfiguration(for: selectedElement)[5][1], color: subshellConfiguration(for: selectedElement)[5][1] == 0 ? .gray : spdfColors[1], arrowRotation: 320, textRotation: -320, arrowWidth: 70, shellSymbol: "P")
                           .offset(x:133, y: -50)
            //d
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[5][2], radius: 105, color: subshellConfiguration(for: selectedElement)[5][2] == 0 ? .gray : spdfColors[2])
            AnimatedArrow(noOfElectron: subshellConfiguration(for: selectedElement)[5][2], color: subshellConfiguration(for: selectedElement)[5][2] == 0 ? .gray : spdfColors[2], arrowRotation: 140, textRotation: -140, arrowWidth: 50, shellSymbol: "D")
                           .offset(x:-55, y: 40)
        }
    }
}


struct QShell:View {
    @State var selectedElement:Int
    var body: some View {
        ZStack{
            nucleusElectron(selectedElement: selectedElement)
            ForEach(0..<6,id: \.self){index in
                if getShellElectronData(selectedElement: selectedElement)[index] != 0 {
                    if index %  2 == 0{
                        ClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(30 + index * 10), color: .red,isHibirnateShell: true)
                    }else{
                        AntiClockWiseAtomShell(numberOfBalls: getShellElectronData(selectedElement: selectedElement)[index], radius: CGFloat(30 + index * 10), color: .red,isHibirnateShell: true)
                    }
                }
            }
            //s
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[6][0], radius: 90, color: subshellConfiguration(for: selectedElement)[6][0] == 0 ? .gray : spdfColors[0])
            AnimatedArrow(noOfElectron: subshellConfiguration(for: selectedElement)[6][0], color: subshellConfiguration(for: selectedElement)[6][0] == 0 ? .gray : spdfColors[0], arrowRotation: 220, textRotation: -220, arrowWidth: 60, shellSymbol: "S")
                           .offset(x:-25, y: -55)
            //p
            ClockWiseAtomShell(numberOfBalls: subshellConfiguration(for: selectedElement)[6][1], radius: 105, color: subshellConfiguration(for: selectedElement)[6][1] == 0 ? .gray : spdfColors[1])
            AnimatedArrow(noOfElectron: subshellConfiguration(for: selectedElement)[6][1], color: subshellConfiguration(for: selectedElement)[6][1] == 0 ? .gray : spdfColors[1], arrowRotation: 320, textRotation: -320, arrowWidth: 40, shellSymbol: "P")
                           .offset(x:130, y: -50)
        }
    }
}

struct BouncingBackButton: View {
    let selectedElement: Int
    @State private var isBouncing = false
    
    var body: some View {
        Text("Back")
            .padding()
            .font(.body)
            .bold()
            .foregroundColor(contentFontColor) // Replace with your actual color
            .background(elementCardColor[selectedElement]) // Replace with your actual color array
            .cornerRadius(20)
            .scaleEffect(isBouncing ? 1.2 : 1.0) // Scale effect for bouncing
            .shadow(color:elementCardColor[selectedElement],radius: isBouncing ? 10 : 0)
            .onAppear {
                // Start the bouncing animation
                withAnimation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                    isBouncing.toggle()
                }
            }
    }
}

struct ElementNavigatorRight: View {
    @Binding var selectedElement: Int
    @State private var isPulsing: Bool = false // State for pulsing animation
   
    var body: some View {
        ZStack {
            Button {
                // Use guard to ensure selectedElement stays within a valid range
                guard selectedElement < elementCardColor.count - 1 else { return }
                selectedElement += 1
            } label: {
                let nextIndex = min(selectedElement + 1, elementCardColor.count - 1) // Safe index

                RoundedRectangle(cornerRadius: 5)
                    .fill(elementCardColor[nextIndex])
                    .frame(width: screenWidth * 0.04, height: screenWidth * 0.04)
                    .scaleEffect(isPulsing ? 1.2 : 1.0) // Apply pulsing effect
                    .shadow(color: elementCardColor[nextIndex], radius: selectedElement == elementCardColor.count - 1 ? 0 : 5)
                    .animation(
                        .easeInOut(duration: 1.0).repeatForever(autoreverses: true),
                        value: isPulsing
                    )
                    .onAppear {
                        isPulsing = true
                    } // Start pulsing when the view appears
                    .overlay {
                        Text(elementsSymbols[nextIndex])
                            .font(.custom(atomSymbolFont, size: isIPhone ? 20 : 25))
                    }
            }
            .opacity(selectedElement == elementCardColor.count - 1 ? 0.5 : 1) // Dim when at the last element
            .disabled(selectedElement == elementCardColor.count - 1) // Disable button when at the last element
        }
        .foregroundColor(contentFontColor)
    }
}


struct ElementNavigatorLeft: View {
    @Binding var selectedElement: Int
    @State private var isPulsing: Bool = false // State for pulsing animation
  
    var body: some View {
        ZStack {
            Button {
                // Use guard to ensure selectedElement stays within a valid range
                guard selectedElement > 0 else { return }
                selectedElement -= 1
            } label: {
                let prevIndex = max(selectedElement - 1, 0) // Safe index

                RoundedRectangle(cornerRadius: 5)
                    .fill(elementCardColor[prevIndex])
                    .frame(width: screenWidth * 0.04, height: screenWidth * 0.04)
                    .scaleEffect(isPulsing ? 1.2 : 1.0) // Apply pulsing effect
                    .shadow(color: elementCardColor[prevIndex], radius: 5)
                    .animation(
                        .easeInOut(duration: 1.0).repeatForever(autoreverses: true),
                        value: isPulsing
                    )
                    .onAppear { isPulsing = true } // Start pulsing when the view appears
                    .overlay {
                        Text(elementsSymbols[prevIndex])
                            .font(.custom(atomSymbolFont, size: isIPhone ? 20 : 25))
                    }
            }
            .opacity(selectedElement == 0 ? 0.5 : 1) // Dim when at the first element
            .disabled(selectedElement == 0) // Disable button when at the first element
        }
        .foregroundColor(contentFontColor)
    }
}



struct PreviewTester:PreviewProvider{
    static var previews: some View{
        PeriodicTableView()
    }
}
