import UIKit
import Foundation
/**
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 你可以按任意顺序返回答案。

  

 示例 1：

 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
 示例 2：

 输入：nums = [3,2,4], target = 6
 输出：[1,2]
 示例 3：

 输入：nums = [3,3], target = 6
 输出：[0,1]
  

 提示：

 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 只会存在一个有效答案
 进阶：你可以想出一个时间复杂度小于 O(n2) 的算法吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */




let nums = [2, 7, 11, 5]
//let nums = [3, 9, 9, 6]
let target = 18

//无法处理数组中相同整数的状况
func twoSum(nums: [Int], target: Int) -> [Int] {
    for num in nums {
        let currentIndex = nums.firstIndex(of: num)!
        for num2 in nums {
            if num + num2 == target {
                //无法处理数组中相同整数的状况, firstIndex 会返回第一个index
                let anotherIndex = nums.firstIndex(of: num2)!
                if anotherIndex != currentIndex {
                    return [currentIndex, anotherIndex]
                }
            }
        }
    }
    return [0]
}

func twoSumIJ(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count {
        let curNum = nums[i]
        for j in i+1..<nums.count {
            let secNum = nums[j]
            if curNum + secNum == target {
                return [i, j]
            }
        }
    }
    return [0]
}

func twoSumDic(_ nums: [Int], _ target: Int) -> [Int] {
    var dic: [Int: Int] = [:]
    for i in 0..<nums.count {
        let num = nums[i]
        let value = target - num
        if let matchedIndex = dic[value] {
            return [matchedIndex, i]
        } else {
            dic[num] = i
        }
    }
    return [0]
}

twoSum(nums: nums, target: target)

twoSumIJ(nums, target)

twoSumDic(nums, target)

