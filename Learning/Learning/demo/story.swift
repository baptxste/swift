//
//  story.swift
//  Learning
//
//  Created by Baptiste Chachura on 04/05/2026.
//

import SwiftUI

struct story: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // rien à faire ici
    }
}


#Preview {
    story()
}
