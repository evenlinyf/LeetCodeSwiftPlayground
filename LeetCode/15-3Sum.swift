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


struct ThreeSumWithTwoSum {
    /** hahaha
     执行用时： 4828 ms, 在所有 Swift 提交中击败了5.04%的用户
     内存消耗：17.7 MB, 在所有 Swift 提交中击败了46.17%的用户
     */
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        var result: [[Int]] = []
        for idx in 0..<nums.count {
            let curNum = nums[idx]
            let secNum: [Int] = Array(nums[0..<idx]) + Array(nums[(idx+1)...])
            let res = twoSumDic(secNum, (curNum * -1))
            if res.count > 0 {
                for resi in res {
                    var arr = [curNum]
                    arr.append(contentsOf: resi.map{secNum[$0]})
                    arr = arr.sorted()
                    if result.contains(arr) == false {
                        result.append(arr)
                    }
                }
            }
        }
        return result
    }
    
    func twoSumDic(_ nums: [Int], _ target: Int) -> [[Int]] {
        var dic: [Int: Int] = [:]
        var matched = [[Int]]()
        for i in 0..<nums.count {
            let num = nums[i]
            let value = target - num
            if let matchedIndex = dic[value] {
                matched.append([matchedIndex, i])
            } else {
                dic[num] = i
            }
        }
        return matched
    }
}
//1212ms beat 10.71%
//17.8m beat 24.45%
func threeSum3(_ nums: [Int]) -> [[Int]] {
    let sortedNums = nums.sorted()
    var res: [[Int]] = []
    for i in 0..<sortedNums.count {
        let num = sortedNums[i]
        if num > 0 {
            break
        }
        var resArr = Array(sortedNums[(i+1)...])
        while resArr.count > 1 {
            let result = num + resArr.first! + resArr.last!
            if result == 0 {
                if res.contains([num, resArr.first!, resArr.last!]) == false {
                    res.append([num, resArr.first!, resArr.last!])
                }
                resArr = Array(resArr[1..<(resArr.count-1)])
            } else if result > 0 {
                resArr.removeLast()
            } else {
                resArr = Array(resArr[1...])
            }
        }
    }
    return res
}

//332ms beat 20.40%
//100ms beat 94.34% reason: 加了 guard nums.coun >= 3 else { return [] } & if i > 0 && sortedNums[i] == sortedNums[i-1] { continue }
//17.5m beat 87.68%
func threeSumLR(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else {
        return []
    }
    let sortedNums = nums.sorted()
    var res: Set<[Int]> = []
    for i in 0..<sortedNums.count {
        if i > 0 && sortedNums[i] == sortedNums[i - 1] {
            continue
        }
        let num = sortedNums[i]
        if num > 0 { break }
        var left = i + 1
        var right = sortedNums.count - 1
        while left < right {
            let result = num + sortedNums[left] + sortedNums[right]
            if result == 0 {
                let matchArr = [num, sortedNums[left], sortedNums[right]]
                res.insert(matchArr)
                left += 1
                right -= 1
            } else if result > 0 {
                right -= 1
            } else {
                left += 1
            }
        }
    }
    return Array(res)
}

//100ms beat 94.34%
//17.8M beat 25.05%
//https://github.com/soapyigu/LeetCode-Swift/blob/master/Array/ThreeSum.swift
func threeSumGuyi(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    
    guard nums.count >= 3 else {
        return res
    }
    
    let nums = nums.sorted()
    
    for i in 0..<nums.count - 2 {
        if i > 0 && nums[i] == nums[i - 1] {
            continue
        }
        
        let firstNum = nums[i], remainingSum = -firstNum
        var m = i + 1, n = nums.count - 1
        
        while m < n {
            if nums[m] + nums[n] == remainingSum {
                res.append([firstNum, nums[m], nums[n]])
                
                repeat {
                    m += 1
                } while nums[m] == nums[m - 1] && m < n
                
                repeat {
                    n -= 1
                } while nums[n] == nums[n + 1] && m < n
            } else if nums[m] + nums[n] < remainingSum {
                m += 1
            } else {
                n -= 1
            }
        }
    }
    
    return res
}
//[[-4,0,4],[-4,1,3],[-3,-1,4],[-3,0,3],[-3,1,2],[-2,-1,3],[-2,0,2],[-1,-1,2],[-1,0,1]]
//[-1,0,1,2,-1,-4,-2,-3,3,0,4]
//[-1,0,1,2,-1,-4]
let res = threeSumLR([0,0,0])
print(res.count)
print(res)
//threeSum([-1,0,1,2,-1,-4])
