/**
 设计一个找到数据流中第 k 大元素的类（class）。注意是排序后的第 k 大元素，不是第 k 个不同的元素。

 请实现 KthLargest 类：

 KthLargest(int k, int[] nums) 使用整数 k 和整数流 nums 初始化对象。
 int add(int val) 将 val 插入数据流 nums 后，返回当前数据流中第 k 大的元素。

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/kth-largest-element-in-a-stream
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class KthLargest {

    let k: Int
    var nums: [Int] = []
    var kNums: [Int] = []

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            _ = add(num)
        }
    }
    
    func add(_ val: Int) -> Int {
        nums.append(val)
        //print(nums.sorted(by: >))
        guard kNums.count >= k else {
            kNums.append(val)
            kNums = kNums.sorted(by: >)
            return kNums.last ?? 0
        }
        guard kNums.last! < val else {
            return kNums.last!
        }
        kNums.removeLast()
        kNums.append(val)
        kNums = kNums.sorted(by: >)
        return kNums.last!
    }
}

let cl = KthLargest(3, [1,5,8,145,34,123,55,150])

cl.add(3)
cl.add(10)
cl.add(300)

