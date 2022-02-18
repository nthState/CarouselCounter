//
//  AnimatableFontModifier.swift
//  CarouselCounter
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/CarouselCounter/blob/main/LICENSE for license information.
//

import SwiftUI

struct AnimatableFontModifier: AnimatableModifier {
  
  var fontName: String
  var fontSize: CGFloat
  
  var animatableData: CGFloat {
    get { fontSize }
    set { fontSize = newValue }
  }
  
  func body(content: Content) -> some View {
    content
      .font(Font.custom(fontName, size: fontSize))
  }
}

public extension View {
  func animatableFont(fontName: String, fontSize: CGFloat) -> some View {
    self.modifier(AnimatableFontModifier(fontName: fontName, fontSize: fontSize))
  }
}
