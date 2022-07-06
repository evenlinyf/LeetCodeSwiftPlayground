//: [Previous](@previous)
/**
 给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

 返回 滑动窗口中的最大值 。

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/sliding-window-maximum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
 输出：[3,3,5,5,6,7]
 */

import Foundation

//超出时间限制 hhh 数组切片+ 排序 果然不行
func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    guard nums.count > 0 && k > 1 else { return nums }
    guard nums.count > k else { return [nums.sorted().last!] }
    var maxArray: [Int] = [] // 存放最大值
    for index in 0...(nums.count-k) {
        let window = nums[index..<(index + k)]
        print(window)
        if let max = window.sorted().last {
            maxArray.append(max)
        }
    }
    return maxArray
}

//双端队列 https://github.com/soapyigu/LeetCode-Swift/blob/master/Array/SlidingWindowMaximum.swift
func maxSlidingWindow2(_ nums: [Int], _ k: Int) -> [Int] {
    var maxIdx = [Int]()
    var res = [Int]()
    
    for i in 0..<nums.count {
        while maxIdx.count > 0 && nums[maxIdx.last!] < nums[i] {
            maxIdx.removeLast()
        }
        
        maxIdx.append(i)
        
        if i >= k - 1 {
            if maxIdx.first! + k == i {
//                    maxIdx.removeFirst()//超出时间限制
                maxIdx = Array(maxIdx[1...])
            }
            
            res.append(nums[maxIdx.first!])
        }
    }
    
    return res
}

//maxSlidingWindow2([1,3,-1,-3,5,3,6,7], 3)
maxSlidingWindow2([7, 2, 4], 2)
//maxSlidingWindow2([1,3,1,2,0,5], 3)
//: [Next](@next)
