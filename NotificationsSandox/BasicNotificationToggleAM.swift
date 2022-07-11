import SwiftUI
import UserNotifications

struct BasicNotificationToggleAM: View {
  var hour: Int
  @State var AMisOn = false
  var body: some View {
    let identifier = "Basic" + String(hour) + "AM"
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
          print("onChange:AM +\(String(format: "%02d", hour)) :00 true")
          //通知のスケジュールを追加
          UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, _) in
            if granted {
              let content = UNMutableNotificationContent()
              content.title = (String(format: "%02d", hour)) + ":00"
              content.body = "Every" + String(hour) + "AM"
              content.sound = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "2s.wav"))
              var triggerTime = DateComponents()
              triggerTime.hour = hour
              let trigger = UNCalendarNotificationTrigger(dateMatching: triggerTime, repeats: true)
              let request = UNNotificationRequest(identifier: identifier,content: content, trigger: trigger)
              let center = UNUserNotificationCenter.current()
              //center.getPendingNotificationRequests(completionHandler: request)
              center.add(request)
            }else{
              print("failed to request")
            }
          }
        } else {
          print("onChange:AM +\(String(format: "%02d", hour)) :00 false")
          //identifierを指定して通知のスケジュールを除去
          UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
        }
      }
    }
  }
}
