//
//  AiBiPayApp.swift
//  AiBiPay
//
//  Created by Michael on 12/28/22.
//

import SwiftUI

@main
struct AiBiPayApp: App {
    @StateObject var viewModel = SessionViewModel()

    var body: some Scene {
        WindowGroup {
            SessionView()
                .environmentObject(viewModel)

        }
    }
}
