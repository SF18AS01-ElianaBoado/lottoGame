//
//  LuckyNumber.swift
//  lottoGame
//
//  Created by Eliana Boado on 1/14/19.
//  Copyright © 2019 Eliana Boado. All rights reserved.
//

import Foundation

class LuckyNumber {
    var numbers : [Int] = [1, 2, 3, 4, 5, 6]        //property called numbers array
    var maxVal : Int {                              //property called maxVal
        didSet {        //make sure that i pick a new set of lucky numbers
            pickAll();
        }
    }
    
    init(maxVal : Int) {        //This init method would hwlp to pass the maxVal
        self.maxVal = maxVal;
        pickAll();              //this will initializer
    }
    
    func number(index : Int) -> Int{    //index : 0 ...5 & users can access our numbers
        return numbers[index]
    }
    
    func pick(index : Int) -> Int {     //index : 0 .. 5 & for picking a random number
        var unique : Bool;
        var val : Int;
        repeat{
            unique = true;
            val = Int(arc4random_uniform(UInt32(maxVal)) + 1)
            for i in 0 ..< 6 {
                if (numbers[i] == val) {
                    unique = false;
                    break;         //break the loop
                }
            }
        }while !unique
        numbers[index] = val;
        return val;
    }
    
    func pickAll() {        //method to pick all of 6 numbers
        for i in 0 ..< 6 {
            pick(index: i);
        }
    }
}
