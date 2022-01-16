//
//  ExampleSwiftUIView.swift
//  CarouselCounter
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/CarouselCounter/blob/master/LICENSE for license information.
//

import SwiftUI

struct ExampleSwiftUIView {
  @State var number: Int = 50
}

extension ExampleSwiftUIView: View {
  
  var body: some View {
    
    VStack(spacing: 24) {
      counter
      controlButtons
    }
    
  }
  
  var counter: some View {
    Text("1")
      .border(Color.pink)
      .carouselCounter(value: number) { index, layout in
        
        Text("\(layout.value)")
          .animatableFont(fontName: "Arial", fontSize: 22 * layout.scale)
          .opacity(layout.opacity)
          .zIndex(layout.zIndex)
        
      }
      .animation(Animation.easeIn, value: number)
      .frame(height: 56)
  }
  
  var controlButtons: some View {
    HStack {
      Button {
        withAnimation {
          number -= 1
        }
      } label: {
        Text("Decrement")
      }
      
      Button {
        withAnimation {
          number += 1
        }
      } label: {
        Text("Increment")
      }
    }
    .padding()
  }
  
}

#if DEBUG

struct ExampleSwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleSwiftUIView()
  }
}

#endif
