import SwiftUI

private struct Course: Identifiable {
    let id = UUID()
    let name: String
    let teacher: String
    let color: Color
}
private struct Assignment: Identifiable {
    let id = UUID()
    let title: String
    let course: String
    let due: String
}

private let sampleCourses = [
    Course(name: "Geometry", teacher: "Ms. Anderson", color: .blue),
    Course(name: "Physics", teacher: "Mr. Roberts", color: .orange),
    Course(name: "English", teacher: "Ms. Carter", color: .purple),
    Course(name: "Biology", teacher: "Mr. Lee", color: .green)
]
private let sampleAssignments = [
    Assignment(title: "Chapter 4 Review", course: "Geometry", due: "Today"),
    Assignment(title: "Momentum Problem Set", course: "Physics", due: "Tomorrow"),
    Assignment(title: "Reading Response", course: "English", due: "Friday"),
    Assignment(title: "Cell Structure Notes", course: "Biology", due: "Monday")
]

struct DashboardView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 22) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("YOUR LEARNING SPACE").font(.caption.bold()).tracking(1.2).foregroundStyle(.secondary)
                    Text("Welcome to StarterApp").font(.largeTitle.bold())
                }
                HStack(spacing: 12) {
                    metric("4", label: "Courses", icon: "books.vertical", color: .blue)
                    metric("3", label: "Due soon", icon: "calendar", color: .orange)
                }
                sectionTitle("My Courses")
                ForEach(sampleCourses) { course in CourseRow(course: course) }
                sectionTitle("Upcoming Work")
                ForEach(sampleAssignments.prefix(3)) { item in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.title).font(.headline)
                        Text("\(item.course) · Due \(item.due)").font(.subheadline).foregroundStyle(.secondary)
                    }
                    .padding(14).frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background, in: RoundedRectangle(cornerRadius: 14))
                }
            }.padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Home")
    }
    private func metric(_ value: String, label: String, icon: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: icon).foregroundStyle(color).font(.title2)
            Text(value).font(.largeTitle.bold())
            Text(label).foregroundStyle(.secondary)
        }.frame(maxWidth: .infinity, alignment: .leading).padding()
            .background(.background, in: RoundedRectangle(cornerRadius: 16))
    }
    private func sectionTitle(_ title: String) -> some View {
        Text(title).font(.title2.bold()).padding(.top, 4)
    }
}

struct CoursesView: View {
    var body: some View {
        List(sampleCourses) { course in CourseRow(course: course).listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)) }
            .listStyle(.plain).navigationTitle("Courses")
            .searchable(text: .constant(""), prompt: "Search courses")
    }
}
private struct CourseRow: View {
    let course: Course
    var body: some View {
        HStack(spacing: 14) {
            RoundedRectangle(cornerRadius: 12).fill(course.color.gradient).frame(width: 48, height: 48)
                .overlay(Text(String(course.name.prefix(1))).font(.title2.bold()).foregroundStyle(.white))
            VStack(alignment: .leading, spacing: 4) {
                Text(course.name).font(.headline)
                Text(course.teacher).font(.subheadline).foregroundStyle(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right").font(.caption.bold()).foregroundStyle(.tertiary)
        }.padding(12).background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 15))
    }
}

struct AssignmentsView: View {
    @State private var done = Set<UUID>()
    var body: some View {
        List(sampleAssignments) { item in
            HStack(spacing: 12) {
                Button {
                    if done.contains(item.id) { done.remove(item.id) } else { done.insert(item.id) }
                } label: {
                    Image(systemName: done.contains(item.id) ? "checkmark.circle.fill" : "circle")
                        .font(.title2).foregroundStyle(done.contains(item.id) ? .green : .secondary)
                }.buttonStyle(.plain)
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title).font(.headline).strikethrough(done.contains(item.id))
                    Text(item.course).font(.subheadline).foregroundStyle(.secondary)
                    Text("Due \(item.due)").font(.caption.bold()).foregroundStyle(.orange)
                }
            }.padding(.vertical, 6)
        }.navigationTitle("Assignments")
    }
}

struct InboxView: View {
    var body: some View {
        ContentUnavailableView("No messages yet", systemImage: "envelope", description: Text("Course messages and announcements will appear here when connected to a school service."))
            .navigationTitle("Inbox")
    }
}
struct ProfileView: View {
    var body: some View {
        Form {
            Section {
                Label("Student", systemImage: "person.crop.circle.fill").font(.title2)
            }
            Section("StarterApp") {
                LabeledContent("Version", value: "1.0")
                LabeledContent("Platform", value: "Native iOS")
            }
            Section {
                Text("Demo content only. Schoology sign-in and live school data are not connected yet.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }.navigationTitle("Profile")
    }
}
