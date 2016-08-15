//: Playground - noun: a place where people can play

/**
 //分治法：
 There are two sorted arrays nums1 and nums2 of size m and n respectively. Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 Example 1:
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 
 Example 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5
 
 //http://blog.csdn.net/waycaiqi/article/details/46122905
 
 */
import UIKit

var str = "Hello, playground"

let a = [1,1]
let b = [1,1]
//1,6,7,8,9,10,11,20,30
let c = [12,14,23,45,54]

func findMedianSortedArrays(nums1: [Int], _ nums2: [Int]) -> Double {
    
    let m = nums1.count
    let n = nums2.count
    
    
    let k = m + n
    
    //是奇数
    if k & 1 != 0 {
    
        return find(nums1, 0, m,nums2, 0,  n, k/2+1)
    
    }else {
    //是偶数
        
        return (find(nums1, 0, m,nums2, 0,  n, k/2+1)
             + find(nums1, 0, m,nums2, 0,  n, k/2))/2
        
    }
    
}
func find(A: [Int], _ aStart: Int, _ aEnd: Int,_ B: [Int],_ bStart: Int, _ bEnd: Int, _ kth: Int) -> Double  {
    
    print("kth = \(kth)")
    //1. 统一将长度短的放置于find函数的前面项
    if aEnd > bEnd {
        print("1.aStart = \(aStart)")
        return find(B, bStart, bEnd,  A, aStart, aEnd, kth)
    }
    
    //2. 长度为空，则答案等同于求另外一个数组的中位数
    if aEnd <= 0 {
        return Double(B[bStart + kth - 1])
    }
    //3. 递归到终点，两个数组的aStart和bStart已经到了中位数的位置
    if kth == 1 {
        print("bStart = \(bStart)")
        print("2.aStart = \(aStart)")

        return Double(min(A[aStart], B[bStart]))
    }

    let pa = min(kth/2, aEnd)
    print("pa=\(pa)")
    
    let pb = kth - pa
    print("pb=\(pb)")
    if A[aStart + pa - 1] < B[bStart + pb - 1] {
      
        print("aaa")
        return find(A, aStart + pa, aEnd - pa, B, bStart, bEnd,  kth - pa)
   
    }else {
       
        print("bbbb")
        print("3.aStart = \(aStart)")
        return find(A, aStart, aEnd, B, bStart + pb, bEnd - pb, kth - pb)

    
    }
    
}


findMedianSortedArrays(b,a)





//21e4c0f66f7420f134a143e3eec76df5558b83ff61230f65856e3248c05ec6d7
//21e4c0f66f7420f134a143e3eec76df5558b83ff61230f65856e3248c05ec6d7
