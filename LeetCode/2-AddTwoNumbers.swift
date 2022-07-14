import UIKit
//给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
//
//请你将两个数相加，并以相同形式返回一个表示和的链表。
//
//你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/add-two-numbers
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


//链表相加

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {
            return l1 ?? l2
        }
        
        var l1 = l1
        var l2 = l2
        
        var carry: Int = 0
        let node = ListNode()
        var currentNode = node
        
        while l1 != nil || l2 != nil {
            if l1 != nil {
                carry += l1!.val
                l1 = l1!.next
            }
            if l2 != nil {
                carry += l2!.val
                l2 = l2!.next
            }
            let nextNode = ListNode(carry%10)
            carry /= 10
            currentNode.next = nextNode
            currentNode = currentNode.next!
        }
        
        if carry > 0 {
            currentNode.next = ListNode(carry%10)
        }
        
        return node.next
}

