//
//  PushNotification.swift
//  ElectronIQ
//
//  Created by shamtech07 on 10/02/25.
//

import SwiftUI

import UserNotifications

func requestNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
        if granted {
            print("✅ Permission granted!")
        } else {
            print("❌ Permission denied.")
        }
    }
}

import UserNotifications

func scheduleDailyNotification() {
    let randomElementName = elementsNames.randomElement() ?? "Helium"
    
    let content = UNMutableNotificationContent()
    content.title = "Element of the Day: \(randomElementName)"
    content.body = "Discover the properties of \(randomElementName) today!"
    content.sound = .default

    // Set notification time to 12:00 PM
    var dateComponents = DateComponents()
    dateComponents.hour = 12
    dateComponents.minute = 0
    dateComponents.second = 0

    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

    let request = UNNotificationRequest(identifier: "daily_element_notification", content: content, trigger: trigger)

    // Add to Notification Center
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error.localizedDescription)")
        } else {
            print("✅ Daily notification scheduled for 12 PM")
        }
    }
}


//struct PushNotification: View {
//    var body: some View {
//        VStack(spacing: 20) {
//            Button("Request Permission") {
//                requestNotificationPermission()
//            }
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .cornerRadius(10)
//
//            Button("Send Notification") {
//                scheduleDailyNotification()
//            }
//            .padding()
//            .background(Color.green)
//            .foregroundColor(.white)
//            .cornerRadius(10)
//        }
//    }
//}
//
//
//#Preview {
//    PushNotification()
//}
