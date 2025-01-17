//
//  UniversalProps.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 07/11/24.
//
import SwiftUI

let screenWidth: CGFloat = UIScreen.main.bounds.width // measures the width of the screen
let screenHeigth: CGFloat = UIScreen.main.bounds.width // measures the height of the screen
var isIPhone: Bool {
    UIDevice.current.userInterfaceIdiom == .phone
}

let menuViewsTitles: [String] = ["Home", "About Us" , "Contact Us","Privacy Policy"]

let shellColors:[Color] = [.kShell,.lShell,.mShell,.nShell,.oShell,.pShell,.qShell]

let shellSymbols:[String] = ["K","L","M","N","O","P","Q"]

let spdfColors:[Color] = [.s1,.p1,.d1,.F_1]
	
let spdfOrdering:[Color] = [.s1,.s1,.p1,.s1,.p1,.d1,.s1,.p1,.d1,.F_1,.s1,.p1,.d1,.F_1,.s1,.p1,.d1,.s1,.p1]

let content:[String]=["1s","2s","2p","3s","3p","3d","4s","4p","4d","4f","5s","5p","5d","5f","6s","6p","6d","7s","7p"]

let APR: [Int] = [0, 1, 2, 3, 4, 6, 5, 7, 10,8,11,14,9,12,15,17,13,16,18]

let spdfSymbols:[String] = ["S","P","D","F"]
