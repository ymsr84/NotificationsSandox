import SwiftUI

struct BasicNotificationToggleAM: View {
  var hour: Int
  @State var AMisOn = false {
    //NotificationCenterへ trueでadd falseでremoveさせるためのdidSet
    didSet {
      if self.AMisOn {
        print("didset:AM +\(String(format: "%02d", hour)) :00 true")
      } else {
        print("didset:AM +\(String(format: "%02d", hour)) :00 false")
      }
    }
  }
  var body: some View {
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
        } else {
          print("onChange:AM +\(String(format: "%02d", hour)) :00 false")
        }
      }
    }
  }
}
