import SwiftUI

struct NotificationToggleSimpleView: View {
  @Binding var isRotate180: Bool
  @State var allAMisON = false
  @State var allPMisON = false
  @State var useHalf = false
  @State var useSound = true
  @State var useBanner = true
  @State var useList = true
  @State var useBagde = false

  var body: some View {
    NavigationView {
      Form {
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
        Section {
          Toggle(isOn: $isRotate180) {
            Text("Rotate view 180°")
          }
        } header: {
          Text("General")
        } footer: {
          Text("オンにすると上下が逆になります．")
        }
        Section {
          Toggle(isOn: $useHalf) {
            Text("30分毎")
          }
        } header: {
          Text("拡張")
        }
        Section {
          Toggle(isOn: $useSound) {
            Text("サウンド")
          }
          Toggle(isOn: $useBanner) {
            Text("バナー")
          }
          Toggle(isOn: $useList) {
            Text("リスト")
          }
          Toggle(isOn: $useBagde) {
            Text("バッジ")
          }
        } header: {
          Text("通知方法")
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
