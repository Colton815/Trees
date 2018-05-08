//
//  StopWatch.swift
//  BinarySearchTree
//
//  Created by Colton Walker on 5/1/18.
//  Copyright © 2018 Colton Walker. All rights reserved.
//

import Foundation


struct StopWatch{
    
    var startTime: TimeInterval = 0.0
    var endTime: TimeInterval = 0.0
    
    mutating func start(){
        startTime = NSDate().timeIntervalSince1970
    }
    
    mutating func stop()->TimeInterval{
        endTime = NSDate().timeIntervalSince1970
        return endTime - startTime
    }
}
