//: [Previous](@previous)
//https://leetcode.cn/problems/swap-nodes-in-pairs/
import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(val: Int = 0, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}


// 1 2 3 4    2 1 4 3
struct Solution {
    // 时间复杂度 O(n) 空间复杂度 O(n)
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let head = head, let next = head.next else {
            return head
        }
        head.next = swapPairs(next.next)
        next.next = head
        return next
    }
}