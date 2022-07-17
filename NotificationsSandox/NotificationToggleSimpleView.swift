import SwiftUI

struct NotificationToggleSimpleView: View {
  @Binding var isRotate180: Bool
  @State var useSound = true
  @State var useBanner = true
  @State var useList = true
  @State var useBagde = false

  var body: some View {
    NavigationView {
      Form {
        Section {
          AlertXtimesXsecAfterSample()
          ToggleBasic00Notification()
          ToggleBasic30Notification()
        } header: {
          Text("拡張")
        }
        Section {
          ForEach(1..<13) { hour in
            HStack {
              BasicNotificationToggleAM(hour: hour, AMisOn: AppStorage(wrappedValue: false, "AM\(hour)isOn"))
              Spacer(minLength: 20)
              BasicNotificationTogglePM(hour: hour, PMisOn: AppStorage(wrappedValue: false, "PM\(hour)isOn"))
            }
          }
        } header: {
          Text("Loacl push alert per hour")
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
      .navigationTitle("Loacl push alert")
    }
  }
}

struct NotificationToggleSimpleView_Previews: PreviewProvider {
  @State static var isRotate180 = false
  static var previews: some View {
    NotificationToggleSimpleView(isRotate180: $isRotate180)
      .previewDevice("iPhone Xs Max")
    NotificationToggleSimpleView(isRotate180: $isRotate180)
      .previewDevice("iPhone SE")
  }
}
