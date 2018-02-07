//
//  WindowMonitor.swift
//  XestiMonitors-iOS
//
//  Created by Martin Mungai on 22/01/2018.
//  Copyright © 2018 Xesticode. All rights reserved.
//

#if os(iOS)
    
    import Foundation
    import UIKit
    
    ///
    /// A `WindowMonitor` instance monitors the window for changes to the user
    /// interface and provides important event-handling behaviours.
    ///
    
    public class WindowMonitor: BaseNotificationMonitor {
        
        public enum Event {
            
            case didBecomeHidden
            case didBecomeKey
            case didBecomeVisible
            case didResignKey
        }
        
        public struct Options: OptionSet {
            
            ///
            /// Monitor `didBecomeHidden` events
            ///
            public static let didBecomeHidden = Options(rawValue: 1 << 0)
            
            ///
            /// Monitor `didBecomeKey` events
            ///
            public static let didBecomeKey = Options(rawValue: 1 << 1)
            
            ///
            /// Monitor `didBecomeVisible` events
            ///
            public static let didBecomeVisible = Options(rawValue: 1 << 2)
            
            ///
            /// Monitor `didResignKey` events
            ///
            public static let didResignKey = Options(rawValue: 1 << 3)
            
            ///
            /// Monitor all events
            ///
            
            public static let all: Options = [.didBecomeHidden,
                                              .didBecomeKey,
                                              .didBecomeVisible,
                                              .didResignKey]
            
            public init(rawValue: UInt) {
                self.rawValue = rawValue
            }
            
            public let rawValue: UInt
        }
        
        public init(queue: OperationQueue = .main,
                    options: Options = .all) {
            self.options = options
            
            super.init(queue: queue)
        }
        
        private let options: Options
        
        public override func addNotificationObservers() {
            super.addNotificationObservers()
            
            if options.contains(.didBecomeHidden) {
                observe(.UIWindowDidBecomeHidden) { _ in
                    
                }
            }
            
            if options.contains(.didBecomeKey) {
                observe(.UIWindowDidBecomeKey) { _ in
                    
                }
            }
            
            if options.contains(.didBecomeVisible) {
                observe(.UIWindowDidBecomeVisible) { _ in
                    
                }
            }
            
            if options.contains(.didResignKey) {
                observe(.UIWindowDidResignKey) { _ in
                    
                }
            }
        }
        
        
    }


#endif
