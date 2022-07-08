//: [Previous](@previous)

/**
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

 示例 1：

 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 示例 2：

 输入：nums = []
 输出：[]
 示例 3：

 输入：nums = [0]
 输出：[]
  

 提示：

 0 <= nums.length <= 3000
 -105 <= nums[i] <= 105

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
//解答错误
func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 2 else { return [] }
    var result: [[Int]] = []
    for idx in 0..<nums.count {
        let curNum = nums[idx]
        let secNum: [Int] = Array(nums[0..<idx]) + Array(nums[(idx+1)...])
        if let res = twoSumDic(secNum, (curNum * -1)) {
            var arr = [curNum]
            arr.append(contentsOf: res.map{secNum[$0]})
            arr = arr.sorted()
            if result.contains(arr) == false {
                result.append(arr)
            }
        }
    }
    return result
}

//两数相加的结果只有一个， 对于多个的还没处理
func twoSumDic(_ nums: [Int], _ target: Int) -> [Int]? {
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
    return nil
}

//[[-4,0,4],[-4,1,3],[-3,-1,4],[-3,0,3],[-3,1,2],[-2,-1,3],[-2,0,2],[-1,-1,2],[-1,0,1]]
threeSum([-1,0,1,2,-1,-4,-2,-3,3,0,4])
//threeSum([-1,0,1,2,-1,-4])
