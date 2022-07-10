import SwiftUI

struct NotificationToggleSimpleView: View {
  @Binding var isRotate180: Bool
  var body: some View {
    NavigationView {
      Form {
        Section {
          Toggle(isOn: $isRotate180) {
            Text("Rotate view 180°")
          }
        } header: {
          Text("General")
        }
        Section {
          ForEach(1..<13) { hour in
            HStack {
              BasicNotificationToggleAM(hour: hour)
              BasicNotificationTogglePM(hour: hour)
            }
          }
        } header: {
          Text("Push alert per hour")
        }
      }
      .navigationTitle("Push alert")
    }
  }
}

struct NotificationToggleSimpleView_Previews: PreviewProvider {
  @State static var isRotate180 = false
  static var previews: some View {
    NotificationToggleSimpleView(isRotate180: $isRotate180)
  }
}
