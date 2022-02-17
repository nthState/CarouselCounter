import SwiftUI
import CarouselCounter

struct MyView: View {
  
  var body: some View {
    Text("100")
      .carouselCounter(value: number) { index, layout in
        
        Text("\(layout.value)")
          .animatableFont(fontName: "Arial", fontSize: 22 * layout.scale)
          .opacity(layout.opacity)
          .zIndex(layout.zIndex)
        
      }
      .animation(Animation.easeIn, value: number)
  }
  
}
