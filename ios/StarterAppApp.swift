import SwiftUI

@main
struct StarterAppApp: App {
    var body: some Scene {
        WindowGroup {
            StarterTabView()
        }
    }
}

struct StarterTabView: View {
    var body: some View {
        TabView {
            NavigationStack { DashboardView() }
                .tabItem { Label("Home", systemImage: "house.fill") }
            NavigationStack { CoursesView() }
                .tabItem { Label("Courses", systemImage: "books.vertical.fill") }
            NavigationStack { AssignmentsView() }
                .tabItem { Label("Work", systemImage: "checklist") }
            NavigationStack { InboxView() }
                .tabItem { Label("Inbox", systemImage: "envelope.fill") }
            NavigationStack { ProfileView() }
                .tabItem { Label("Profile", systemImage: "person.crop.circle") }
        }
        .tint(Color(red: 0.12, green: 0.36, blue: 0.72))
    }
}
