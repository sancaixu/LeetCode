//: Playground - noun: a place where people can play

/*
 
 Given a string, find the length of the longest substring without repeating characters.
 //给定一个字符串,查找最长的子串的长度没有重复字符
 Examples:
 
 Given "abcabcbb", the answer is "abc", which the length is 3.
 //给一个“abcabcbb”的字串,输出的答案是“abc”,长度是3。
 Given "bbbbb", the answer is "b", with the length of 1.
 //给一个“bbbbb”,答案是“b”,长度是1
 Given "pwwkew"的字符串, the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 //给一个pwwkew”的字符串,答案是“wke”,与3的长度。注意,答案必须是一个字符串,“pwke”子序列而不是子字符串

 JAVA Example
 
         char[] arr = s.toCharArray();
         int max = 0, cur = 0, start = 0;
         int[] map = new int[255];
         for(int i = 0; i < arr.length; i++){
             char c = arr[i];
             if(map[c] == 0){
                 //first time appears
                 map[c] = i+1; //mark the position
                 cur++;  //length
                 if(cur > max) max = cur;
             }else{
                 int end = map[c]-1; //real index of prev appearance of current char
                 for(int j = start; j < end; j++){
                     map[arr[j]] = 0; //mark off previous letters as never appeared
                 }
                 start = end+1; //start of the new substring
                 map[arr[i]] = i+1; //update current position
                 cur = i-end; //update length of current substring
             }
         }
         return max;
*/

import UIKit

//extension String {
//    
//    func subStringWithRange(r: Range<Int>) -> String {
//        let startIndex = self.startIndex.advancedBy(r.startIndex)
//        let endIndex = self.endIndex.advancedBy(r.endIndex)
//        
//        return self[Range(startIndex ..< endIndex)]
//    }
//    mutating func removeSubStringRange(r: Range<Int>) {
//        let startIndex = self.startIndex.advancedBy(r.startIndex)
//        let endIndex = self.endIndex.advancedBy(r.endIndex)
//        
//         self.removeRange(Range(startIndex ..< endIndex))
//    }
////    subscript (r: Range<Int>) -> String{
////        get {
////        
////            let startIndex = self.startIndex.advancedBy(r.startIndex)
////            let endIndex = self.endIndex.advancedBy(r.endIndex)
////            
////            return self[Range(startIndex ..< endIndex)]
////          //  return self.substringWithRange(Range.init( startIndex ..< endIndex))
////            
////        }
////        set {
////            let startIndex = self.startIndex.advancedBy(r.startIndex)
////            let endIndex = self.startIndex.advancedBy(r.endIndex)
////            let strRange = Range(startIndex..<endIndex)
////            self.replaceRange(strRange, with: newValue)
////        }
//    //}
//}

class Solution {
 
    /**
      求字符串的最长无重复字串的长度
     
     - parameter s: 字符串
     
     - returns: 字串的长度
     */
    func lengthOfLongestSubstring(s: String) -> Int {
    
        var subStringChars: [Character] = []
        
        var longest = 0
        for c in s.characters {
            
            if subStringChars.contains(c) {
            
                let index = subStringChars.indexOf(c)
                longest = max(longest, subStringChars.count)
                subStringChars.removeRange(Range(0 ... index!))
                
            }
            subStringChars.append(c)
        }

        longest = max(longest, subStringChars.count)
        print(longest)
        return longest

    }
    
}

let solution = Solution()
print(NSDate.timeIntervalSinceReferenceDate())
solution.lengthOfLongestSubstring("abcabcbb")
print(NSDate.timeIntervalSinceReferenceDate())

