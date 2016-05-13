//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func towSumProblem(nums: [Int], _ target: Int) -> [Int]? {

    var dict = [Int: Int]()
    
    for i in 0 ..< nums.count {
    
        if let newKey = dict[nums[i]]{
        
            return [newKey,i];
        }else {
        
            dict[target - nums[i]] = i ;
            
        }
    }
    
    return nil
    
}

let array = [2,4,6,-1,10,5];

towSumProblem(array, 10)
