//
//  rotationEffect.swift
//  NotificationsSandox
//
//  Created by Yamashiro on 2022/07/10.
//

import SwiftUI

struct RotationEffect: View {
  //ケーブルが上向きに避けられるように，充電スタンドにiPhoneを上下逆向きに置くので180度回転させたいがiPhone X 以降のノッチ付きディスプレイ搭載機種ではupside downが非推奨で許可されていてもデバイス側で回転できない
  //通常は isRotate180 = false 自分の環境ではtrue
  @State var isRotate180 = false
  var body: some View {
    VStack {
      //viewに値を持たせているから切り替えると値が保持されない 見た目を作っている間は後回しにした
      if isRotate180 {
        NotificationToggleSimpleView(isRotate180: $isRotate180)
          .rotationEffect(.degrees(180))
      } else {
        NotificationToggleSimpleView(isRotate180: $isRotate180)
      }
    }
  }
}

struct RotationEffect_Previews: PreviewProvider {
  static var previews: some View {
    RotationEffect()
  }
}
