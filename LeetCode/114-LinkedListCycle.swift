//https://leetcode.cn/problems/linked-list-cycle/
import Foundation

class LinkedListCycle {
    
    func hasCycle(_ head: ListNode?) -> Bool {
        guard var head = head else { return false }
        var nodes: [ListNode] = [head]
        while let next = head.next {
            if nodes.contains(where: {$0 === next} ) { return true }
            nodes.append(next)
            head = next
        }
        return false
    }
    
    func hasCycleRabbitTurtle(_ head: ListNode?) -> Bool {
        var turtle: ListNode? = head
        var rabbit: ListNode? = head?.next
        while rabbit != nil {
            if turtle === rabbit {
                return true
            }
            turtle = turtle?.next
            rabbit = rabbit?.next?.next
        }
        return false
    }
    
}
