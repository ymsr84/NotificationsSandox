import SwiftUI

struct BasicNotificationTogglePM: View {
  var hour: Int
  @State var PMisOn = false {
    //NotificationCenterへ trueでadd falseでremoveさせるためのdidSet
    didSet {
      if self.PMisOn {
        print("didset:PM +\(String(format: "%02d", hour)) :00 true")
      } else {
        print("didset:PM +\(String(format: "%02d", hour)) :00 false")
      }
    }
  }
  var body: some View {
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
        } else {
          print("onChange:PM +\(String(format: "%02d", hour)) :00 false")
        }
      }
    }
  }
}
