import SwiftUI

// Entry point for the app. Forces dark mode to match the dashboard.
@main
struct RowDashboardApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
