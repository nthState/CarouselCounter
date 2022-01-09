//
//  SwiftUIView.swift
//  CarouselCounter
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/CarouselCounter/blob/master/LICENSE for license information.
//

import SwiftUI

struct SwiftUIView: View {
  
  @State var value: Int = 2
  
  var body: some View {
    Text("hello")
      .carouselCounter(vaue: value)
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIView()
  }
}
