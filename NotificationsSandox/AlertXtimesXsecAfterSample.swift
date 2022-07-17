import SwiftUI

struct AlertXtimesXsecAfterSample: View {
  @State var isOn = false
  var notificationModel = NotificationModel()
  var interval:Double = 5
  var body: some View {
    //@State @AppStorage("basic\(hour)") var PMisOn = false
    //@AppStorage("Basic\(hour)") var PMisOn = false
    let title = "NotificationsSandox"
    let body = "Interval\(interval)"
    let identifier = "AlertXtimesXsecAfterSample" + String(interval)
    let repeats = false
    let debuglog = String(isOn) + " identifier:\(identifier)"
    
    VStack {
      Toggle(isOn: $isOn) {
        Text("Interval:\(String(interval)) sec")
      }
      .onChange(of: isOn) { PMisOn in
        if PMisOn {
          print(debuglog)
          notificationModel.request(title: title, body: body, identifier: identifier , repeats: repeats, timeInterval: interval)
        } else {
          print(debuglog)
          //通知のスケジュールを除去
          notificationModel.remove(identifier: identifier)
        }
      }
    }
  }
}
