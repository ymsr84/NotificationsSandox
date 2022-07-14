import SwiftUI
import UserNotifications

struct BasicNotificationToggleAM: View {
  var hour: Int
  @State var AMisOn = false
  var notificationModel = NotificationModel()

  var body: some View {
    //@State @AppStorage("basic\(hour)") var AMisOn = false
    //@AppStorage("Basic\(hour)") var AMisOn = false
    let title = "NotificationsSandox"
    let body = String(hour) + "AM"
    let identifier = "BasicEveryAM\(hour)"
    let debuglog = String(AMisOn) + ":AM\(String(format: "%02d", hour)):00" + " identifier:\(identifier)"

    HStack {
      Toggle(isOn: $AMisOn) {
        HStack {
          //1:00（先頭の列)だけAM表示させたい
          if hour == 1 {
            Text("AM")
          } else {
            Text("AM")
              .hidden()
          }
          Text((String(format: "%02d", hour)) + ":00")
        }
      }
      .onChange(of: AMisOn) { AMisOn in
        if AMisOn {
          print(debuglog)
          //通知のスケジュールを追加
          notificationModel.request(title: title, body: body, identifier: identifier, hour: hour)
        } else {
          print(debuglog)
          //通知のスケジュールを除去
          notificationModel.remove(identifier: identifier)
        }
      }
    }
  }
}
