//
//  NotificationView.swift
//  Learning
//
//  Created by Baptiste Chachura on 03/05/2026.
//

import SwiftUI
import UserNotifications
struct NotificationView: View {
    var body: some View {
        Button("Generate Notification",action: generateNotification).buttonStyle(.borderedProminent)
        Button("Generate Notification",action: generateNotification).buttonStyle(.bordered)
        Button(action: generateNotification) {
            Text("Generate Notification")
        }
    }
    private func generateNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Test Notification"
        content.body = "Ceci est une notification locale."
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }
}



#Preview {
    NotificationView()
}


