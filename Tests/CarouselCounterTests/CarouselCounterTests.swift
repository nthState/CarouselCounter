//
//  CarouselCounterTests.swift
//  CarouselCounter
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/CarouselCounter/blob/master/LICENSE for license information.
//

import XCTest
@testable import CarouselCounter
import SwiftUI

final class CarouselCounterTests: XCTestCase {
  
  func test_() throws {
    
    let x = CarouselCounter(value: 0) { index, layout in
      EmptyView()
    }
    
    print(x)
    
  }
  
  func test_2() throws {
    
    let x = Text("1")
      .carouselCounter(value: 1) { index, layout in
        EmptyView()
      }
    
    print(x)
    
  }
  
}
