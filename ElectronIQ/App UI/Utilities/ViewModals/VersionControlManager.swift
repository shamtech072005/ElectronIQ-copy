//
//  ViewModal.swift
//  H3'sChemistryApp
//
//  Created by shamtech07 on 09/11/24.
//


import Foundation
import Combine

struct VersionInfo: Codable {
    let version_code: String
    let url:String
}

class VersionViewModel: ObservableObject {
    @Published var versionInfo: VersionInfo?
    @Published var isLoading = false
    @Published var error: String?

    // Fetch version from API
    func fetchVersion() {
        guard let url = URL(string: "https://yrvi6y00u8.execute-api.us-west-2.amazonaws.com/dev/chemistry_app_data") else {
            error = "Invalid URL"
            return
        }

        isLoading = true
        error = nil

        URLSession.shared.dataTask(with: url) { [weak self] data, _, networkError in
            DispatchQueue.main.async {
                guard let self = self else { return }

                self.isLoading = false

                if let networkError = networkError {
                    self.error = "Failed to fetch data: \(networkError.localizedDescription)"
                    return
                }

                guard let data = data else {
                    self.error = "No data received."
                    return
                }

                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode(VersionInfo.self, from: data) {
                    self.versionInfo = decodedData
                    print(decodedData)
                } else {
                    self.error = "Failed to decode data."
                    print("not connect")
                }
                
            }
        }
        .resume()
    }
}
import SwiftUI

struct VersionView: View {
    @StateObject private var viewModel = VersionViewModel()

    var body: some View {
        VStack {
            // Show loading spinner when fetching version
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding(.trailing,20)
            }
            // Show error if any
            else if let error = viewModel.error {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding(.trailing,20)
            }
            // Show version info once fetched
            else if let version = viewModel.versionInfo?.version_code {
                Text("Version \(version)")
                    .font(.custom(versionFont,size: 10 ))
                Text("Powered by Hope3 Foundation")
                    .font(.custom(versionFont,size: 12 ))
                Text("Developed by Arjava Technologies")
                    .font(.custom(versionFont,size: 12 ))
            }
        }
        .opacity(0.5)
        
        .padding()
        .foregroundColor(versionContentColor)
        .onAppear {
            viewModel.fetchVersion()  // Fetch version when the view appears
        }
        
    }
}

#Preview {
    Onboarding()
}
//
//import Foundation
//import Combine
//
//struct AppVersion: Codable {
//    let version_code: String
//    let url: String
//}
//
//class AppVersionViewModel: ObservableObject {
//    @Published var appVersion: AppVersion?
//    private var cancellables = Set<AnyCancellable>()
//    
//    func fetchAppVersion() {
//        guard let url = URL(string: "your_api_endpoint_here") else { return }
//        
//        URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: AppVersion.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { _ in },
//                  receiveValue: { [weak self] version in
//                self?.appVersion = version
//            })
//            .store(in: &cancellables)
//    }
//}
//
//struct ContentView: View {
//    @StateObject private var versionViewModel = AppVersionViewModel()
//    
//    var body: some View {
//        VStack {
//            Text("App Version: \(versionViewModel.appVersion?.version_code ?? "Loading...")")
//            Text("Support URL: \(versionViewModel.appVersion?.url ?? "")")
//        }
//        .onAppear {
//            versionViewModel.fetchAppVersion()
//        }
//    }
//}
