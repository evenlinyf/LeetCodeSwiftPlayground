import UIKit


func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    var rNum = nums1 + nums2
    rNum = rNum.sorted { v1, v2 in
        return v1 < v2
    }
    
    let count = rNum.count
    guard count > 0 else {
        return 0
    }
    if count%2 == 0 {
        let result = Double(rNum[count/2] + rNum[count/2-1])/2
        return result
    } else {
        return Double(rNum[count/2])
    }
}


findMedianSortedArrays([1,3], [2])



/**
 给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。

 算法的时间复杂度应该为 O(log (m+n)) 。

  

 示例 1：

 输入：nums1 = [1,3], nums2 = [2]
 输出：2.00000
 解释：合并数组 = [1,2,3] ，中位数 2
 示例 2：

 输入：nums1 = [1,2], nums2 = [3,4]
 输出：2.50000
 解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
  

  

 提示：

 nums1.length == m
 nums2.length == n
 0 <= m <= 1000
 0 <= n <= 1000
 1 <= m + n <= 2000
 -106 <= nums1[i], nums2[i] <= 106

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/median-of-two-sorted-arrays
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
