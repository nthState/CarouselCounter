//
//  CarouselCounterTests.swift
//  CarouselCounter
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/CarouselCounter/blob/main/LICENSE for license information.
//

import XCTest
@testable import CarouselCounter
import SwiftUI

final class CarouselCounterTests: XCTestCase {
  
  func test_viewbuilder_called() throws {
    
    let expectation = XCTestExpectation(description: "")
    
    let x = CarouselCounter(value: 0) { index, layout in
      EmptyView()
      let _ = expectation.fulfill()
    }

    let _ = x.counterContent(0, LayoutData(index: 0, id: 0, value: 0, offset: 0, scale: 0, opacity: 0, zIndex: 0))

    wait(for: [expectation], timeout: 1)
    
  }

}
