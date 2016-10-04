//
//  Utils.swift
//  SwiftCalc
//
//  Created by Zach Zeleznick on 9/21/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import Foundation

// MARK:  Define any general utilities here

class Helper {
    // MARK: Sample Helper Class
    /*
        Helper.log10(100.0)
        >> Double = 2
    */
    
    class func add(_ first: String, _ second: String, _ decFirst: Bool, _ decSecond: Bool) -> String {
        //check if either string is a decimal, for double addition
        if decFirst == true || decSecond == true {
            let result: Double = (first as NSString).doubleValue + (second as NSString).doubleValue
            var newResult: Int = 0
            //check if double can be converted to int
            if floor(result) == result {
                newResult = Int(result)
                return String(newResult)
            } else {
            //return double
            return String(result)
            }
        }
        //integer addition
        else if first.characters.count >= 1{
            let result: Int = Int(first)! + Int(second)!
            return String(result)
        }
        //return empty string
        return second
    }
    
    class func sub(_ first: String, _ second: String, _ decFirst: Bool, _ decSecond: Bool) -> String {
        if decFirst == true || decSecond == true {
            let result: Double = Double(first)! - Double(second)!
            var newResult: Int = 0
            if floor(result) == result {
                newResult = Int(result)
                return String(newResult)
            } else {
                return String(result)
            }
        } else if first.characters.count >= 1{
            let result: Int = Int(first)! - Int(second)!
            return String(result)
        }
        return second
    }
    
    class func mult(_ first: String, _ second: String, _ decFirst: Bool, _ decSecond: Bool) -> String {
        if decFirst == true || decSecond == true {
            let result: Double = Double(first)! * Double(second)!
            var newResult: Int = 0
            if floor(result) == result {
                newResult = Int(result)
                return String(newResult)
            } else {
                return String(result)
            }
        } else if first.characters.count >= 1{
            let result: Int = Int(first)! * Int(second)!
            
            return String(result)
        }
        return second
    }
    class func div(_ first: String, _ second: String) -> String {
        let result: Double = Double(first)! / Double(second)!
        var newResult: Int = 0
        if floor(result) == result {
            newResult = Int(result)
            return String(newResult)
        }
        return String(result)
    }
    
    class func log10(x: Double) -> Double {
        return log(x)/log(10.0)
    }

    class func subInt(x: Int, y: Int) -> Int {
        return x - y
    }
    class func divideInt(x: Int, y: Int) -> Int {
        return x/y
    }
    class func multInt(x: Int, y: Int) -> Int {
        return x * y
    }

    class func addDouble(x: String, y: String) -> Double {
        return Double(x)! + Double(y)!
    }
    
    
    class func subDouble(x: String, y: String) -> Double {
        return Double(x)! - Double(y)!
    }
    class func divideDouble(x: String, y: String) -> Double {
        return Double(x)!/Double(y)!
    }
    class func multDouble(x: String, y: String) -> Double {
        return Double(x)! * Double(y)!
    }
}
