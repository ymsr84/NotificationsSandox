import Foundation
class NotificationDetail: ObservableObject {
  @Published var enable:Bool
  var hour: Int!
  var minute: Int!

  init(enable:Bool, hour:Int) {
    self.enable = enable
    self.hour = hour
  }

  init(enable:Bool, minute:Int) {
    self.enable = enable
    self.minute = minute
  }

  init(enable:Bool, hour:Int, minute:Int) {
    self.enable = enable
    self.hour = hour
    self.minute = minute
  }
}
