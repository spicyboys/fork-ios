//
//  ForkApp.swift
//  Fork
//
//  Created by Jacob Williamson on 3/15/21.
//

import SwiftUI
import Firebase
import GoogleSignIn
import UIKit

@main
struct ForkApp: App {

    init () {
        //Where AppDelegate code would go if google got their shit together w/ SwiftUI2. Until then it's gottat go in App Delegate above^^^
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = "10745776339-t95li1afvsm5rqvm8c7jfiu9o6t4qqlj.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().presentingViewController = UIApplication.shared.windows.first?.rootViewController
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(\.managedObjectContext,persistenceController.container.viewContext)
            HomeView()
        }
    }
    
}

