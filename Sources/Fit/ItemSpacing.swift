//
//  ItemSpacing.swift
//
//
//  Created by Oleh Korchytskyi on 09.01.2024.
//

import SwiftUI


/// Defines an item spacing rule in the ``Fit`` layout.
///
/// Also can be constructed using Integer or Float literal:
/// ```
/// let spacing: ItemSpacing = 8    // .fixed(8)
/// let spacing: ItemSpacing = 10.5 // .fixed(10.5)
/// ```
@available(iOS 16.0, *)
public enum ItemSpacing: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    /// Uses **ViewSpacing** distance to determine preferred spacing, but not less then specified minimum.
    case viewSpacing(minimum: CGFloat)
    
    /// Fixed spacing beween subviews.
    case fixed(CGFloat)
    
    /// Uses **ViewSpacing** distance to determine preferred spacing.
    public static var viewSpacing: ItemSpacing { 
        .viewSpacing(minimum: -.infinity)
    }
    
    @inline(__always)
    func distance(between leadingViewSpacing: ViewSpacing, and trailingViewSpacing: ViewSpacing) -> CGFloat {
        switch self {
        case .viewSpacing(minimum: let minimumSpacing):
            max(minimumSpacing, leadingViewSpacing.distance(to: trailingViewSpacing, along: .horizontal))
        case .fixed(let spacing):
            spacing
        }
    }
    
    // MARK: ExpressibleByFloatLiteral
    /// Creates **.fixed** ``ItemSpacing``.
    /// - Parameter value: spacing distance.
    public init(floatLiteral value: Double) {
        self = .fixed(value)
    }
    
    // MARK: ExpressibleByIntegerLiteral
    /// Creates **.fixed** ``ItemSpacing``.
    /// - Parameter value: spacing distance.
    public init(integerLiteral value: Int) {
        self = .fixed(CGFloat(value))
    }
    
}

