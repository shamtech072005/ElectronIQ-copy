//
//  UpdateView.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 28/11/24.
//

import SwiftUI

import SwiftUI

struct UpdateView: View {
    @State var isBouncing: Bool = false
    @StateObject private var viewModel = VersionViewModel()
    @State var selectedElement: Int
    var body: some View {
        ZStack {
            AppBackground()
            viewBackgroundColor()
            HStack {
                Image(updatePicture)  // Ensure your image name is correct
                    .resizable()
                    .scaledToFit()
                    

                VStack {
                    Text("Update Available")
                        .font(.title)
                        .bold()

                    Text("Please update to the latest version")
                        .multilineTextAlignment(.center)
                    Link(destination:URL(string: "\(String(describing: viewModel.versionInfo?.url))")!) {
                            Text("Update")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(30)
                                .scaleEffect(isBouncing ? 0.9 : 1.1)
                        }
                        .onAppear {
                            withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                                isBouncing.toggle()
                            }
                        }

                   
                    
                }
                .padding()
            }
            .padding()
        }
    }
}


#Preview {
    UpdateView(selectedElement: 10)
}
