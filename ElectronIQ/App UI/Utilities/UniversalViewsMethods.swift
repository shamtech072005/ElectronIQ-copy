//
//  UniversalViewsMethods.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 08/11/24.
//

import SwiftUI

func AppBackground()->some View{
    Image("app")
        .resizable()
        .scaledToFill()
        .opacity(0.5)
        .edgesIgnoringSafeArea(.all)
}

@ViewBuilder
func getMenuView(at index: Int) -> some View {
    switch index {
    case 1: AboutUsView()
    case 2: Contact_us()
    case 3: PrivacyPolicyView().navigationBarBackButtonHidden(true)
    default: PeriodicTableView()
    }
}

func getShellElectronData(selectedElement:Int)->[Int]{
    return [
        electronicConfiguration[selectedElement][0],
        electronicConfiguration[selectedElement][1]+electronicConfiguration[selectedElement][2],
        electronicConfiguration[selectedElement][3]+electronicConfiguration[selectedElement][4]+electronicConfiguration[selectedElement][5],
        electronicConfiguration[selectedElement][6]+electronicConfiguration[selectedElement][7]+electronicConfiguration[selectedElement][8]+electronicConfiguration[selectedElement][9],
        electronicConfiguration[selectedElement][10]+electronicConfiguration[selectedElement][11]+electronicConfiguration[selectedElement][12]+electronicConfiguration[selectedElement][13],
        electronicConfiguration[selectedElement][14]+electronicConfiguration[selectedElement][15]+electronicConfiguration[selectedElement][16],
        electronicConfiguration[selectedElement][17]+electronicConfiguration[selectedElement][18]
        ]
}

func nonZeroGetShellElectronData(selectedElement:Int)->[Int]{
    let GSED = getShellElectronData(selectedElement: selectedElement)
    var result: [Int] = []
    for i in GSED{
        if i != 0 {
            result.append(i)
        }
        
    }
    return result
}

func subshellConfiguration(for element: Int) -> [[Int]] {
    let configuration = electronicConfiguration[element]
    let subshellSizes = [1, 2, 3, 4, 4, 3, 2] // Number of elements in each subshell
    
    var filteredSubshells: [[Int]] = []
    var index = 0
    
    for size in subshellSizes {
        // Take `size` elements from `configuration` starting at `index`
        let subshell = Array(configuration[index..<min(index + size, configuration.count)])
        if subshell.reduce(0, +) != 0 { // Only add if the sum of elements is non-zero
            filteredSubshells.append(subshell)
        }
        index += size // Move to the next position in `configuration`
        
        // Break early if we've reached the end of `configuration`
        if index >= configuration.count {
            break
        }
    }
    
    return filteredSubshells
}


func aufbaPrinciple(for selectedElement: Int) -> [Int] {
    // Assuming `electronicConfigurationArray` is a 2D array of Int arrays
    
    let AP = electronicConfiguration[selectedElement]
    let reArrangedAufbaPrinciple = [
        AP[0], AP[1], AP[2], AP[3], AP[4], AP[6], AP[5], AP[7],
        AP[10], AP[8], AP[11], AP[14], AP[9], AP[12], AP[15],
        AP[17], AP[13], AP[16], AP[18]
    ]
    
    return reArrangedAufbaPrinciple
}


func randomElement(from array: [String]) -> String? {
    return array.randomElement()
}

