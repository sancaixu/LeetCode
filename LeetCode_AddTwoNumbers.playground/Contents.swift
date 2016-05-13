//: Playground - noun: a place where people can play

import UIKit
/*
You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8

Subscribe to see which companies asked this question
 */

var str = "Hello, playground"

class ListNode {
    var val: Int = 0
    var next: ListNode?
    init(val:Int){
        self.val = val
        self.next = nil
    }
    static func getListNode(nums: [Int]) -> ListNode? {
    
        var list: ListNode?
        var preNode: ListNode?
        for num in nums {
            
            if preNode == nil {
                list = ListNode(val: num)
                preNode = list
                
            }else {
                preNode!.next = ListNode(val: num)
                preNode = preNode?.next
                
            }
        
        }
        print(list?.next)
        return list
    
    }
    class func printss( node: ListNode?) -> [Int] {
        var node1 = node
        var array:[Int] = []
        while node1 != nil {
            array.append(node1!.val)
            node1 = node1!.next
        }
        
        return array
    }
}

var listNode1 = ListNode(val: 10)
var listNode2 = ListNode(val: 2)
var listNode3 = ListNode(val: 10)

listNode1.next = listNode2
listNode2.next = listNode3

var listNode4 = ListNode(val: 7)
var listNode5 = ListNode(val: 2)
var listNode6 = ListNode(val: 10)

listNode4.next = listNode5
listNode5.next = listNode6

class Solution {
    
    func addTwoNumbers(l1: ListNode?,l2: ListNode?) -> ListNode? {
        
        var result: ListNode?
        var cn = 0
  
        if  l1 != nil || l2 != nil {
            
            let value1 = (l1 != nil) ? l1!.val : 0
            let value2 = (l2 != nil) ? l2!.val : 0
            print("cn = \(value1) + \(value2)")

            let sum = value1 + value2
            
            cn = sum/10
            
            result = ListNode(val: sum%10)
            
        

            if (cn == 0){
            
                result?.next = addTwoNumbers(l1?.next, l2: l2?.next)
                
            }else {
                
                let listNode = ListNode(val: cn)
                let value = ((l1?.next != nil) ? (l1?.next!.val)! : 0)
                listNode.val += value
                listNode.next = l1?.next?.next
                result?.next = addTwoNumbers(listNode, l2: l2?.next)
                
            }

        }
        
        
        
        return result
        
    }
    
    
}

var solu = Solution()

var listnode = solu.addTwoNumbers(ListNode.getListNode([8,9,9]), l2: ListNode.getListNode([2]))

var nums = ListNode.printss(listnode!)
print(nums)





        
