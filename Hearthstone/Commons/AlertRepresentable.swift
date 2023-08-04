//
//  AlertRepresentable.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 04/08/23.
//

import SwiftUI

struct AlertController: UIViewControllerRepresentable {
    @Binding var showAlert: Bool
    var title: String
    var message: String
    var actions: [UIAlertAction]

    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController() // Just a dummy controller, as we will present the alert from it
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        guard context.coordinator.alertController == nil, showAlert else { return }

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }

        context.coordinator.alertController = alert

        uiViewController.present(alert, animated: true) {
            self.showAlert = false
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator {
        var alertController: UIAlertController?

        deinit {
            alertController?.dismiss(animated: false)
        }
    }
}
