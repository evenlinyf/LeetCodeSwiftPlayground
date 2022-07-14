//
//  ListNode.swift
//  
//
//  Created by holla on 2022/7/14.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    
    init() {
        self.val = 0
    }
    
    convenience init(_ val: Int) {
        self.init()
        self.val = val
    }
    
    convenience init(_ val: Int, _ next: ListNode?) {
        self.init()
        self.val = val
        self.next = next
    }
    
    func description() -> String {
        var node: ListNode? = self
        var string = ""
        while node?.next != nil {
            string = String(node!.val) + string
            node = node!.next
        }
        return string
    }
}
