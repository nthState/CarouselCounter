//
//  CarouselCounter.swift
//  CarouselCounter
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/CarouselCounter/blob/master/LICENSE for license information.
//

import SwiftUI

public struct LayoutData: Identifiable {
  public let id: Int
  public let value: Int
  public let offset: CGFloat
  public let scale: CGFloat
  public let opacity: CGFloat
  public let zIndex: Double
}

internal struct LayoutContainer: Identifiable {
  let id: Int
  let layout: LayoutData
}

public extension View {
  
  func carouselCounter<CounterContent>(value: Int, @ViewBuilder counterContent: @escaping (Int, LayoutData) -> CounterContent) -> some View where CounterContent: View {
    modifier(CarouselCounter(value: value, counterContent: counterContent))
  }
  
}

private struct CarouselCounter<CounterContent>: AnimatableModifier where CounterContent: View {
  
  /// The number to display
  var value: Int
  
  /// The content to render
  var counterContent: (Int, LayoutData) -> CounterContent
  
  init(value: Int, @ViewBuilder counterContent: @escaping (Int, LayoutData) -> CounterContent) {
    self.value = value
    self.counterContent = counterContent
  }
  
  var animatableData: Int {
    get { value }
    set { value = newValue }
  }
  
  
  func body(content: Content) -> some View {
    
    let n = self.value
    let viewIdBase = self.value
    
    let items: [LayoutContainer] = [
      LayoutContainer(id: 0, layout: LayoutData(id: 0 + viewIdBase, value: n-2, offset: -40, scale: 0.5,  opacity: 0.15,    zIndex: 100)),
      LayoutContainer(id: 1, layout: LayoutData(id: 1 + viewIdBase, value: n-1, offset: -20, scale: 0.75, opacity: 0.25,    zIndex: 150)),
      LayoutContainer(id: 2, layout: LayoutData(id: 2 + viewIdBase, value: n,   offset: 0,   scale: 1,    opacity: 1,       zIndex: 300)),
      LayoutContainer(id: 3, layout: LayoutData(id: 3 + viewIdBase, value: n+1, offset: +20, scale: 0.75, opacity: 0.25,    zIndex: 151)),
      LayoutContainer(id: 4, layout: LayoutData(id: 4 + viewIdBase, value: n+2, offset: +40, scale: 0.5,  opacity: 0.15,    zIndex: 101))
    ]
    
    return ZStack(alignment: .center) {
      //ForEach(items.indices, id: \.self) { index in
      ForEach(items) { item in
        //let item = items[index]
        counterContent(item.id, item.layout)
          .offset(x: item.layout.offset)
          .id(item.layout.id)
//          .offset(x: item.offset)
//          .zIndex(item.zIndex)
//          .id(item.id)

//        Text("\(item.value)")
//          .offset(x: item.offset)
//          .border(Color.blue)
//          .border(Color.green)
//          .animatableFont(fontName: "Arial", fontSize: 22 * item.scale)
//          .opacity(item.opacity)
//          .zIndex(item.zIndex)
//          .id(item.id)
      }
    }
    //.background(Color.orange)
  }
  
}



//
//
//public struct CarouselCounter {
//    public private(set) var text = "Hello, World!"
//
//    public init() {
//    }
//}
////
////  EditRateView.swift
////  AroundSound
////
////  Created by Chris Davis on 12/12/2021.
////
//
//import SwiftUI
//
//
//struct EditRateView {
//
//  @EnvironmentObject var appEnvironment: AppEnvironment
//  @Binding var item: AudioItemModel
//
//  @State private var number: Int = 44
//}
//
//extension EditRateView: View {
//
//
//  var body: some View {
//
//    //let animation = Animation.default
//    let animation = Animation.easeInOut(duration: 0.02)
//    //let animation = Animation.interpolatingSpring(mass: 0.1, stiffness: 1, damping: 0.4, initialVelocity: 0.8)
//
//    let gesture =  DragGesture()
//      .onChanged { gesture in
//        //withAnimation(animation) {
//        withAnimation {
//          let x = gesture.startLocation.x + gesture.translation.width
//          self.number = Int(x)
//        }
//      }
//      .onEnded { _ in
//
//      }
//
//    return VStack {
//      content
//      testButtons
//    }
//    .frame(width: 100, height: 100)
//    .background(Color.pink)
//    .gesture(gesture)
//  }
//
//  var testButtons: some View {
//
//    let animation = Animation.easeInOut(duration: 2)
//
//
//    return HStack {
//      Button {
//        withAnimation(animation) {
//          self.number -= 1
//        }
//      } label: {
//        Text("-")
//      }
//
//      Button {
//        withAnimation(animation) {
//          self.number += 1
//        }
//      } label: {
//        Text("+")
//      }
//
//    }
//  }
//
//  var content: some View {
//    Text("hello")
//      .border(Color.pink)
//      .modifier(MovingCounterModifier(number: number))
//  }
//
//}
//
//struct MovingCounterModifier: AnimatableModifier {
//
//  var number: Int
//
//  var animatableData: Int {
//    get { number }
//    set { number = newValue }
//  }
//
//  struct item: Identifiable {
//    var id: Int
//    let number: Int
//    let offset: CGFloat
//    let scale: CGFloat
//    let opacity: CGFloat
//    let zIndex: Double
//  }
//
//  func body(content: Content) -> some View {
//    let n = self.number
//
//    let viewIdBase = self.number
//
//    let items: [item] = [
//      item(id: 0 + viewIdBase, number: n-2, offset: -40, scale: 0.5, opacity: 0.15, zIndex: 100),
//      item(id: 1 + viewIdBase, number: n-1, offset: -20, scale: 0.75, opacity: 0.25, zIndex: 150),
//      item(id: 2 + viewIdBase, number: n,   offset: 0,   scale: 1, opacity: 1, zIndex: 300),
//      item(id: 3 + viewIdBase, number: n+1, offset: +20, scale: 0.75, opacity: 0.25, zIndex: 151),
//      item(id: 4 + viewIdBase, number: n+2, offset: +40, scale: 0.5, opacity: 0.15, zIndex: 101)
//    ]
//
//    return ZStack(alignment: .center) {
//      ForEach(items) { item in
//          Text("\(item.number)")
//            .border(Color.blue)
//            .offset(x: item.offset)
//            .border(Color.green)
//            .animatableSystemFont(size: 22 * item.scale)
//            .opacity(item.opacity)
//            .zIndex(item.zIndex)
//            .id(item.id)
//      }
//    }
//    .background(Color.orange)
//
//  }
//
//}
//
//struct AnimatableSystemFontModifier: AnimatableModifier {
//    var size: CGFloat
//    var weight: Font.Weight
//    var design: Font.Design
//
//    var animatableData: CGFloat {
//        get { size }
//        set { size = newValue }
//    }
//
//    func body(content: Content) -> some View {
//        content
//            .font(.system(size: size, weight: weight, design: design))
//    }
//}
//
//extension View {
//    func animatableSystemFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
//        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
//    }
//}
//
//#if DEBUG
//
//struct EditRateView_Previews: PreviewProvider {
//
//  static var rate = AudioItemModel(rate: 0.25)
//
//  static var previews: some View {
//    EditRateView(item: .constant(rate))
//      .frame(width: 100, height: 100)
//      .background(Color.gray)
//  }
//}
//
//extension AudioItemModel {
//  public convenience init(rate: Float) {
//    self.init()
//    self.audioProperties = AudioProperties()
//    self.audioProperties.rate = rate
//  }
//}
//#endif
