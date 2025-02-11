//
//  ViewBuilder.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 26/11/24.
//



import SwiftUI
import GoogleMobileAds

struct Onboarding: View {
    @StateObject private var viewModel = VersionViewModel()
    @StateObject private var networkMonitor = NetworkMonitor()
    @StateObject private var interstitialAd = InterstitialAd()
    @State private var hasAttemptedToShowAd = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            if networkMonitor.isConnected {
                if viewModel.isLoading {
                    ZStack{
                        viewBackgroundColor()
                        VStack {
                            ProgressView()
                                .tint(colorScheme == .dark ? .gray : .gray) // Changes the progress indicator color
                                .scaleEffect(1.5) // Optional: Enlarges the ProgressView for better visibility
                            
                            Text("Checking for updates...")
                                .foregroundColor(colorScheme == .dark ? .gray : .gray) // Label text color
                                .font(.headline) // Optional: Adjusts the font style
                                .padding(.top, 8) // Adds spacing above the label
                        }.padding()
                    }
                    
                } else if let versionInfo = viewModel.versionInfo {
                    if versionInfo.version_code == "1.0.0" {
                        PeriodicTableView()
                    } else {
                        UpdateView(selectedElement: 0)
                    }
                } else {
                    Text("Failed to fetch version info.")
                        .foregroundColor(.red)
                        .font(.subheadline)
                }
            } else {
                noNetwork_View()
            }
        }

        .background(colorScheme == .dark ? Color.white : Color.white)
        .onAppear {
            if networkMonitor.isConnected {
                viewModel.fetchVersion()
            }
            
            // Attempt to show ad when the view appears
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Increased delay to 1 second
                showAdIfReady()
            }
        }
        .onChange(of: interstitialAd.isAdReady) { newValue in
            if newValue && !hasAttemptedToShowAd {
                showAdIfReady()
            }
        }
    }
    
    private func showAdIfReady() {
        print("Attempting to show ad...")
        if interstitialAd.isAdReady {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootViewController = windowScene.windows.first?.rootViewController {
                interstitialAd.presentAd(from: rootViewController)
                hasAttemptedToShowAd = true
            } else {
                print("Failed to get root view controller")
            }
        } else {
            print("Ad not ready yet")
        }
    }
}

#Preview {
    Onboarding()
}
