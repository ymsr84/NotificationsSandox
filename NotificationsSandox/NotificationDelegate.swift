//
//  NotificationDelegate.swift
//  NotificationsSandox
//
//  Created by Yamashiro on 2022/07/03.
//

import Foundation
import UserNotifications

class NotificationDelegate:NSObject, UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        //completionHandler([.alert, .list, .badge, .sound]) //~iOS13
        completionHandler([.banner, .list, .badge, .sound]) //iOS14~
    }
}
