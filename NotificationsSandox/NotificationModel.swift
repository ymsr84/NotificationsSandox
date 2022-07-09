//
//  NotificationModel.swift
//  NotificationsSandox
//
//  Created by Yamashiro on 2022/07/08.
//

import Foundation
import NotificationCenter

class NotificationModel: ObservableObject {
  var notificationDelegate = NotificationDelegate()
  let notificationAuthorizationOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
  let notificationSound = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "2s.wav"))
  var pendingNotificationRequests = [UNNotificationRequest]()
  init() {
    UNUserNotificationCenter.current().delegate = notificationDelegate
  }

  func getPendingNotificationRequests() -> Array<UNNotificationRequest> {
    UNUserNotificationCenter.current().getPendingNotificationRequests { request in
      //            print(type(of: request))
      self.pendingNotificationRequests = request
    }
    return self.pendingNotificationRequests
  }

  func request(_ hour: Int = 0, _ minute:Int = 0, _ identifier:String) {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
      (granted, _) in
      if granted {
        let content = UNMutableNotificationContent()
        content.title = "NotificationTitle"
        content.body = "\(hour):\(String(format:"%2d", minute))"
        content.sound = self.notificationSound
        let triggerTime = DateComponents(hour: hour, minute: minute)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerTime, repeats: false)
        let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        //    center.getPendingNotificationRequests(completionHandler: request)
        center.add(request)
      }else{
        print("failed to request")
      }
    }
  }

  func remove(_ identifier:String) {
    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
  }
}

