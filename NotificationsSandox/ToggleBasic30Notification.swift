import SwiftUI

struct ToggleBasic30Notification: View {
  var minute = 30
  var notificationModel = NotificationModel()
  @AppStorage("30perhour") var isOn = false

  var body: some View {
    let title = "NotificationsSandox"
    let body = "PastHalf"
    let identifier = "BasicEveryPastHalf"
    let repeats = true
    let debuglog = String(isOn) + "identifier:\(identifier)"

    Toggle(isOn: $isOn) {
      Text("Half per hour")
    }
    .onChange(of: isOn) { isOn in
      if isOn {
        print(debuglog)
        //通知のスケジュールを追加
        notificationModel.request(title: title, body: body, identifier: identifier, repeats: repeats, minute: minute)
      } else {
        print(debuglog)
        //通知のスケジュールを除去
        notificationModel.remove(identifier: identifier)
      }
    }
  }
}
