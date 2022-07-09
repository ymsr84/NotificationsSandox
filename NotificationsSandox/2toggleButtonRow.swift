//
//  2toggleButtonRow.swift
//  NotificationsSandox
//
//  Created by Yamashiro on 2022/07/08.
//

import SwiftUI

struct toggleButtonRow: View {
  var hour: Int
  @State var AMisOn = false {
    //NotificationCenterへ trueでadd falseでremoveさせるためのdidSet
    didSet {
      if self.AMisOn {
        print("AM +\(String(format: "%02d", hour)) :00 true")
      }
    }
  }
  @State var PMisOn = false {
    //NotificationCenterへ trueでadd falseでremoveさせるためのdidSet
    didSet {
      if self.PMisOn {
        print("PM +\(String(format: "%02d", hour)) :00 true")
      }
    }
  }
  var body: some View {
    HStack {
      Toggle(isOn: $AMisOn) {
        HStack {
          //0:00（先頭の列だけAM表示させたい）
          if hour == 0 {
            Text("AM")
          } else {
            Text("AM")
              .hidden()
          }
          Text((String(format: "%02d", hour)) + ":00")
        }
      }
      Toggle(isOn: $PMisOn) {
        HStack {
          //0:00（先頭の列だけAM表示させたい）
          if hour == 0 {
            Text("PM")
          } else {
            Text("PM")
              .hidden()
          }
          Text((String(format: "%02d", hour)) + ":00")
        }
      }
    }
  }
}
