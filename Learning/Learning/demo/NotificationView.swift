//
//  NotificationView.swift
//  Learning
//
//  Created by Baptiste Chachura on 03/05/2026.
//

import SwiftUI
import UserNotifications



struct NotificationView: View {
    @State private var temporaryMessage: String? = nil
    
    var body: some View {
        Button("Generate Notification", action: generateNotification).buttonStyle(.borderedProminent)
        if let temporaryMessage {
            Text(temporaryMessage)
        }
        //Button("Generate Notification",action: generateNotification).buttonStyle(.bordered)
        //Button(action: generateNotification) {
        //Text("Generate Notification")
        //}
    }

    
    

    private func generateNotification() {
        let center = UNUserNotificationCenter.current()

        // On demande d'abord la permission pour afficher des notifications
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            // Si la permission est refusée ou qu'il y a une erreur, on arrête
            guard granted, error == nil else { return }

            // On crée le contenu de la notification
            let content = UNMutableNotificationContent()
            content.title = "Test Notification"
            content.body = "Ceci est une notification locale."
            
 

            // Déclenchement dans 5 secondes
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            // Requête de notification avec identifiant unique
            let request = UNNotificationRequest(
                identifier: UUID().uuidString,
                content: content,
                trigger: trigger
            )

            // On ajoute la notification au système
            center.add(request)
            temporaryMessage = "Notification générée, elle n'apparaîtra pas dans l'app mais en dehors dans 5 secondes"

            Task {
                try? await Task.sleep(for: .seconds(2))
                temporaryMessage = nil
            }
        }
    }

}



#Preview {
    NotificationView()
}

