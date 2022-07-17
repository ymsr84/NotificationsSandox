import SwiftUI

struct ToggleBasic00Notification: View {
  var minute = 0
  var notificationModel = NotificationModel()
  @AppStorage("00perhour") var isOn = false
  
  var body: some View {
    let title = "NotificationsSandox"
    let body = "O'clock"
    let identifier = "BasicEveryO'clock"
    let repeats = true
    let debuglog = String(isOn) + "identifier:\(identifier)"
    
    Toggle(isOn: $isOn) {
      Text("O'clock per hour")
    }
    .onChange(of: isOn) { isOn in
      if isOn {
        print(debuglog)
        //通知のスケジュールを追加
        for interval in 0..<5 {
          notificationModel.request(title: title, body: body, identifier: identifier + String(interval), repeats: repeats, minute: minute, second: interval * 3)
        }
      } else {
        print(debuglog)
        //通知のスケジュールを除去
        for interval in 0..<5 {
          notificationModel.remove(identifier: identifier + String(interval))
        }
      }
    }
  }
}
