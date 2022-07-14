import SwiftUI
import UserNotifications

struct BasicNotificationTogglePM: View {
  var hour: Int
  @State var PMisOn = false
  var notificationModel = NotificationModel()

  var body: some View {
    //@State @AppStorage("basic\(hour)") var PMisOn = false
    //@AppStorage("Basic\(hour)") var PMisOn = false
    let title = "NotificationsSandox"
    let body = String(hour) + "PM"
    let identifier = "BasicEveryPM\(hour)"
    let debuglog = String(PMisOn) + ":PM\(String(format: "%02d", hour)):00" + " identifier:\(identifier)"

    HStack {
      Toggle(isOn: $PMisOn) {
        HStack {
          //1:00（先頭の列)だけPM表示させたい
          if hour == 1 {
            Text("PM")
          } else {
            Text("PM")
              .hidden()
          }
          Text((String(format: "%02d", hour)) + ":00")
        }
      }
      .onChange(of: PMisOn) { PMisOn in
        if PMisOn {
          print(debuglog)
          //通知のスケジュールを追加

          //試している記述
          //24を渡したとき，その日の24時に通知されるか(当日の+24時＝1日後にならないか)試す
          notificationModel.request(title: title, body: body, identifier: identifier, hour: hour + 12)

          //もとの記述
          //PMと1を渡したら13時にできる方法をみつけるまでPMのとき+12して24時間表記に変換する
          //if hour + 12 == 24 {
          //notificationModel.request(title: title, body: body, identifier: identifier, hour: 0)
          //} else {
          //notificationModel.request(title: title, body: body, identifier: identifier, hour: hour + 12)
          //}
        } else {
          print(debuglog)
          //通知のスケジュールを除去
          notificationModel.remove(identifier: identifier)
        }
      }
    }
  }
}
