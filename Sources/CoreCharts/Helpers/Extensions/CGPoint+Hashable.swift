//
//  File.swift
//  
//
//  Created by Cameron Delong on 10/17/21.
//

import CoreGraphics

extension CGPoint : Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(x)
    hasher.combine(y)
  }
}
