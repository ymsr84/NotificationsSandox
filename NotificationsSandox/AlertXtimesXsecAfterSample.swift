import SwiftUI

struct AlertXtimesXsecAfterSample: View {
  @State var isOn = false
  var notificationModel = NotificationModel()
  var Interval:Double = 5
  var body: some View {
    //@State @AppStorage("basic\(hour)") var PMisOn = false
    //@AppStorage("Basic\(hour)") var PMisOn = false
    let title = "NotificationsSandox"
    let body = "Interval\(Interval)"
    let identifier = "AlertXtimesXsecAfterSample" + String(Interval)
    let repeats = false
    let debuglog = String(isOn) + " identifier:\(identifier)"

    VStack {
      Toggle(isOn: $isOn) {
        Text("Interval:\(String(Interval)) sec")
      }
      .onChange(of: isOn) { PMisOn in
        if PMisOn {
          print(debuglog)
          notificationModel.request(title: title, body: body, identifier: identifier , repeats: repeats, timeInterval: Interval)
        } else {
          print(debuglog)
          //通知のスケジュールを除去
            notificationModel.remove(identifier: identifier)
        }
      }
    }
  }
}
