//
//  NC1App.swift
//  NC1
//
//  Created by Aqilla Shahbani Mahazoya on 01/05/24.
//

import SwiftUI

@main
struct NC1App: App {
    var body: some Scene {
        WindowGroup {
            let conn4VM = Conn4VM()
            ContentView(conn4VM: conn4VM)
        }
    }
}
