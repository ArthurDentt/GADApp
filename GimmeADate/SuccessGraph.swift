//
//  SuccessGraph.swift
//  GimmeADate
//
//  Created by Drew Connelly on 2/15/21.
//

import os.log
import UIKit



class SuccessGraph: NSObject, NSCoding {
    
    //MARK: Properties
    
    var history: Array<Int>
    
    //MARK: Types
    
    struct PropertyKey {
        static let history = "history"
    }
    
    //MARK: Initialization
    
    init?(history:Array<Int>){
        // The name must not be empty
        guard !history.isEmpty else {
            return nil
        }
        
        if history.isEmpty {
            return nil
        }
        
        self.history = history
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(history, forKey: PropertyKey.history)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode an array of points, the initializer should fail.
        guard let history = aDecoder.decodeObject(forKey: PropertyKey.history) as? Array<Int> else {
            os_log("Unable to decode the list of points for a graph object", log: OSLog.default, type: .debug)
            return nil
        }
        
        self.init(history: history)

    }
}
