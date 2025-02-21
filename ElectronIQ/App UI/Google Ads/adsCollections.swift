//
//  adsCollections.swift
//  ElectronIQ
//
//  Created by shamtech07 on 06/12/24.
//

import Foundation
import GoogleMobileAds
import SwiftUI
//banner ads
struct AdBannerView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> GADBannerView {
        let bannerView = GADBannerView(adSize: GADAdSizeFromCGSize(CGSize(width: 320, height: 50))) // Set your desired banner ad size
        bannerView.adUnitID = "ca-app-pub-7374460951052927/2017190647"
        
        // Get the root view controller from the current window scene
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            bannerView.rootViewController = windowScene.windows.first?.rootViewController
        }
        
        bannerView.load(GADRequest())
        return bannerView
    }
    
    func updateUIView(_ uiView: GADBannerView, context: Context) {}
}
//interstistial ads
class InterstitialAd: NSObject, ObservableObject, GADFullScreenContentDelegate {
    @Published var isAdReady = false
    private var interstitialAd: GADInterstitialAd?
    
    override init() {
        super.init()
        loadAd()
    }
    
    func loadAd() {
        print("Loading interstitial ad...")
        let request = GADRequest()
        // Replace this test ad unit ID with your own
        GADInterstitialAd.load(withAdUnitID: "ca-app-pub-7374460951052927/2742242669", request: request) { [weak self] ad, error in
            guard let self = self else { return }
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                self.isAdReady = false
                return
            }
            print("Interstitial ad loaded successfully")
            self.interstitialAd = ad
            self.interstitialAd?.fullScreenContentDelegate = self
            self.isAdReady = true
        }
    }
    
    func presentAd(from rootViewController: UIViewController) {
        if let ad = interstitialAd {
            print("Attempting to present interstitial ad...")
            ad.present(fromRootViewController: rootViewController)
        } else {
            print("Interstitial ad not ready, loading a new ad...")
            loadAd()
        }
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Interstitial ad dismissed")
        isAdReady = false
        loadAd()
    }
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Interstitial ad failed to present with error: \(error.localizedDescription)")
        isAdReady = false
        loadAd()
    }
}
