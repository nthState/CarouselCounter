//
//  CarouselCounter.swift
//  CarouselCounter
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/CarouselCounter/blob/main/LICENSE for license information.
//

import SwiftUI

public struct LayoutData: Identifiable {
  internal let index: Int
  public let id: Int
  /// Number which can be displayed
  public let value: Int
  /// Horizontal offset from the center
  public let offset: CGFloat
  /// Scale decreses from the center
  public let scale: CGFloat
  /// Opacity decreases from the center
  public let opacity: CGFloat
  /// ZIndex decreases from the center
  public let zIndex: Double
}

public extension View {
  
  func carouselCounter<CounterContent>(value: Int, @ViewBuilder counterContent: @escaping (Int, LayoutData) -> CounterContent) -> some View where CounterContent: View {
    modifier(CarouselCounter(value: value, counterContent: counterContent))
  }
  
}

public struct CarouselCounter<CounterContent>: AnimatableModifier where CounterContent: View {
  
  /// The number to display
  private var value: Int
  
  /// The content to render
  internal var counterContent: (Int, LayoutData) -> CounterContent
  
  init(value: Int, @ViewBuilder counterContent: @escaping (Int, LayoutData) -> CounterContent) {
    self.value = value
    self.counterContent = counterContent
  }
  
  var animatableData: Int {
    get { value }
    set { value = newValue }
  }
  
  public func body(content: Content) -> some View {
    
    let n = self.value
    let viewIdBase = self.value
    
    let items: [LayoutData] = [
      LayoutData(index: 0, id: 0 + viewIdBase, value: n-2, offset: -40, scale: 0.5,  opacity: 0.15,    zIndex: 100),
      LayoutData(index: 1, id: 1 + viewIdBase, value: n-1, offset: -20, scale: 0.75, opacity: 0.25,    zIndex: 150),
      LayoutData(index: 2, id: 2 + viewIdBase, value: n,   offset: 0,   scale: 1,    opacity: 1,       zIndex: 300),
      LayoutData(index: 3, id: 3 + viewIdBase, value: n+1, offset: +20, scale: 0.75, opacity: 0.25,    zIndex: 151),
      LayoutData(index: 4, id: 4 + viewIdBase, value: n+2, offset: +40, scale: 0.5,  opacity: 0.15,    zIndex: 101)
    ]
    
    return ZStack(alignment: .center) {
      
      ForEach(items) { layout in
      
        counterContent(layout.index, layout)
          .offset(x: layout.offset)
          .id(layout.id)
      }
    }
    
  }
  
}
