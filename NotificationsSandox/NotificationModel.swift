import Foundation
import NotificationCenter

class NotificationModel: ObservableObject {
  var notificationDelegate = NotificationDelegate()
  let notificationAuthorizationOptions: UNAuthorizationOptions = [.alert, .sound]
  let notificationSound = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "2s.wav"))
  var pendingNotificationRequests = [UNNotificationRequest]()
  init() {
    UNUserNotificationCenter.current().delegate = notificationDelegate
  }
  
  func getPendingNotificationRequests() -> Array<UNNotificationRequest> {
    UNUserNotificationCenter.current().getPendingNotificationRequests { request in
      self.pendingNotificationRequests = request
    }
    return self.pendingNotificationRequests
  }
  
  func request(title: String, body: String, identifier: String, repeats: Bool, hour: Int) {
    UNUserNotificationCenter.current().requestAuthorization(options: notificationAuthorizationOptions) {
      (granted, _) in
      if granted {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = self.notificationSound
        let triggerTime = DateComponents(hour: hour)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerTime, repeats: repeats)
        let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        //    center.getPendingNotificationRequests(completionHandler: request)
        center.add(request)
      }else{
        print("failed to request")
      }
    }
  }

  func request(title: String, body: String, identifier: String, repeats: Bool, minute: Int) {
    UNUserNotificationCenter.current().requestAuthorization(options: notificationAuthorizationOptions) {
      (granted, _) in
      if granted {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = self.notificationSound
        let triggerTime = DateComponents(minute: minute)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerTime, repeats: repeats)
        let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        //    center.getPendingNotificationRequests(completionHandler: request)
        center.add(request)
      }else{
        print("failed to request")
      }
    }
  }

  func request(title: String, body: String, identifier: String, repeats: Bool, hour: Int, minute: Int) {
    UNUserNotificationCenter.current().requestAuthorization(options: notificationAuthorizationOptions) {
      (granted, _) in
      if granted {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = self.notificationSound
        let triggerTime = DateComponents(hour: hour, minute: minute)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerTime, repeats: repeats)
        let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        //    center.getPendingNotificationRequests(completionHandler: request)
        center.add(request)
      }else{
        print("failed to request")
      }
    }
  }

  func request(title: String, body: String, identifier: String, repeats: Bool, timeInterval:Double) {
    UNUserNotificationCenter.current().requestAuthorization(options: notificationAuthorizationOptions) {
      (granted, _) in
      if granted {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = self.notificationSound
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: repeats)
        let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        //    center.getPendingNotificationRequests(completionHandler: request)
        center.add(request)
      }else{
        print("failed to request")
      }
    }
  }

  func remove(identifier:String) {
    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
  }
}
