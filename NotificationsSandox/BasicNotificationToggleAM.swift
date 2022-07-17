import SwiftUI

struct BasicNotificationToggleAM: View {
  var hour: Int
  @AppStorage<Bool> var AMisOn: Bool
  var notificationModel = NotificationModel()

  var body: some View {
    let title = "NotificationsSandox"
    let body = String(hour) + "AM"
    let identifier = "BasicEveryAM\(hour)"
    let repeats = true
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
          notificationModel.request(title: title, body: body, identifier: identifier, repeats: repeats, hour: hour)
        } else {
          print(debuglog)
          //通知のスケジュールを除去
          notificationModel.remove(identifier: identifier)
        }
      }
    }
  }
}
