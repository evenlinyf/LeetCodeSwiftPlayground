//: [Previous](@previous)
// https://leetcode.cn/problems/reverse-linked-list/
// 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(val: Int = 0, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

// 迭代法
func reverseList(_ head: ListNode?) -> ListNode? {
    guard var head = head else { return nil }
    var preNode: ListNode? = nil
    while var nextNode = head.next {
        head.next = preNode
        preNode = head
        head = nextNode
    }
    head.next = preNode
    return head
}


//TODO: 递归法

