#4.Median of Two Sorted Arrays

-

There are two sorted arrays nums1 and nums2 of size m and n respectively.

Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

**Example 1:**

~~~
nums1 = [1, 3]
nums2 = [2]

The median is 2.0
~~~

**Example 2:**

~~~
nums1 = [1, 2]
nums2 = [3, 4]

The median is (2 + 3)/2 = 2.5
~~~

给定两个已排序的数组，求两个数组整体的中位数。要求时间复杂度为O(log(m+n))。


一、解题方法：

1.第一种方法，直接遍历，时间复杂度为O(n),不做说明。

2.第二中方法是：因为题目要求时间复杂度为O(log(m+n)),很显然需要用分治法求解。

二、解题思路：

1.将求两个数组的中位数，换成将两个数组合并排序后，求其第K个数。
根据下图说明：

![图一](http://img.hoop8.com/1607B/enanY1UP.png)
如果两个数组中元素个数分别为m和n，m+n=k有下面两种情况
如果k为基数：则是求k/2+1位置的数
如果k为偶数：则是求k/2+1和k/2位置的数

假如A组和B组的同学人数分别为aEnd和bEnd，有天体育老师要找到他们中间第K矮的人，于是先将两组的同学按从小到大的顺序站成两队。假设k为13。那么此时A组派出的第X矮同学和B组派出的第Y矮同学做比较（注意x+y <= k）

若x为6，y为7。如果A的第6为同学比B的第7为同学还矮，那么A组的前六位同学一定在B组的第7位前面，因为x+y <= k 所已无论如何A组的前6为同学怎么都轮不到第K=13个，所以可以把A组的前6位去掉，在剩下的两个队列里找第k-x个。

**Swift 代码**

~~~

func findMedianSortedArrays(nums1: [Int], _ nums2: [Int]) -> Double {
    
    let m = nums1.count
    let n = nums2.count
  	//1.一共有多少个元素
    let k = m + n
    //2.如果K是奇数
    if k & 1 != 0 {
    
        return find(nums1, 0, m,nums2, 0,  n, k/2+1)
    
    }else {
    //如果K是偶数
        
        return (find(nums1, 0, m,nums2, 0,  n, k/2+1)
             + find(nums1, 0, m,nums2, 0,  n, k/2))/2
        
    }
    
}

func find(A: [Int], _ aStart: Int, _ aEnd: Int,_ B: [Int],_ bStart: Int, _ bEnd: Int, _ kth: Int) -> Double  {
    //1. 统一将长度短的放置于find函数的前面项
    if aEnd > bEnd {
        return find(B, bStart, bEnd,  A, aStart, aEnd, kth)
    }
    
    //2. 长度为空，则答案等同于求另外一个数组的中位数
    if aEnd <= 0 {
        return Double(B[bStart + kth - 1])
    }
    //3. 递归到终点，两个数组的aStart和bStart已经到了中位数的位置
    if kth == 1 {
        return Double(min(A[aStart], B[bStart]))
    }
	//4.如果kth/2 大于 aEnd，需要求出最小值。防止数组越界
    let pa = min(kth/2, aEnd)    
    //5.pa+pb<=kth
    let pb = kth - pa
	//5.如果A[i] < B[j] 则第kth个数在A[i]到A[aEnd] 和B[bStart]和B[j]之间
	//6.如果A[i] > B[j] 则第kth个数在B[j]到B[bEnd] 和A[aStart]和A[i]之间
    if A[aStart + pa - 1] < B[bStart + pb - 1] {
       
       return find(A, aStart + pa, aEnd - pa, B, bStart, bEnd,  kth - pa)
   
    }else {
       
        return find(A, aStart, aEnd, B, bStart + pb, bEnd - pb, kth - pb)
    }   
}

~~~
