//
//  ElectronIQApp.swift
//  ElectronIQ
//
//  Created by shamtech07 on 06/12/24.
//

import SwiftUI
import Firebase
import GoogleMobileAds
import UserNotifications

@main
struct ElectronIQApp: App {
    // Register AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // Hold a reference to NotificationDelegate
    let notificationDelegate = NotificationDelegate()
    
    init() {
        FirebaseApp.configure()
        print("Initializing Google Mobile Ads...")
        GADMobileAds.sharedInstance().start { status in
            print("Google Mobile Ads initialization completed with status: \(status.adapterStatusesByClassName)")
        }
        print("Successfully Configured")

        // Set the notification delegate
        UNUserNotificationCenter.current().delegate = notificationDelegate
        
        // Request permission for notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    scheduleDailyNotification() // Schedule notification only if permission is granted
                }
            } else {
                print("Notification permission denied.")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            Onboarding()
        }
    }
}

// MARK: - AppDelegate
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}

// MARK: - Notification Delegate
class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound]) // Show notification in foreground
    }
}

