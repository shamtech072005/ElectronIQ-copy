//
//  Network View.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 28/11/24.
//

import SwiftUI

struct noNetwork_View: View {
    var body: some View {
        ZStack{
            AppBackground()
            viewBackgroundColor()
            HStack(){
                Image(noNetworkImage)
                  .resizable()
                  .frame(width: screenWidth * 0.4,height: screenWidth * 0.4)
                VStack{
                    Text("You are currently in offline mode \nPlease check your internet connection")
                        .font(.custom(aufbaPrincipleCardFont, size: 18))
                        .padding()
                }
                .foregroundColor(contentFontColor)
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    noNetwork_View()
}
