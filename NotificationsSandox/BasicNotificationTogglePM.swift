import SwiftUI
import UserNotifications

struct BasicNotificationTogglePM: View {
  var hour: Int
  @State var PMisOn = false
  var body: some View {
    let identifier = "Basic" + String(hour) + "PM"
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
          print("onChange:PM +\(String(format: "%02d", hour)) :00 true")
//通知のスケジュールを追加
          UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, _) in
            if granted {
              let content = UNMutableNotificationContent()
              content.title = (String(format: "%02d", hour)) + ":00"
              content.body = "Every" + String(hour) + "PM"
              var triggerTime = DateComponents()
//              DateComponentsの中でPM1が13時として扱える方法が見つかるまで24時間表記に変換する
//              PMのとき12足して24時間表記に変換する
              triggerTime.hour = hour + 12
//              24時のときは0時に変換する
              if triggerTime.hour == 24 {
                triggerTime.hour = 0
              }
              let trigger = UNCalendarNotificationTrigger(dateMatching: triggerTime, repeats: true)
              let request = UNNotificationRequest(identifier: identifier,content: content, trigger: trigger)
              let center = UNUserNotificationCenter.current()
              //    center.getPendingNotificationRequests(completionHandler: request)
              center.add(request)
            }else{
              print("failed to request")
            }
          }
        } else {
          print("onChange:PM +\(String(format: "%02d", hour)) :00 false")
//          identifierを指定して通知のスケジュールを除去
          UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
        }
      }
    }
  }
}
