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

struct Node {
    var number: Int
}

//342 + 465 = 807

func addTwoNumbers(_ n1: Int, _ n2: Int) -> [Node]? {
    
    let num1 = toNodes(number: n1)
    let num2 = toNodes(number: n2)
    
    var shouldUpgrade = false
    
    var theNumber = num1
    if num1.count < num2.count {
        theNumber = num2
    }
    
    var resultNumber: [Node] = []
    
    for index in 0..<theNumber.count {
        let n1 = indexNode(index: index, number: num1)
        let n2 = indexNode(index: index, number: num2)
        var result = n1.number + n2.number
        if shouldUpgrade {
            result += 1
        }
        shouldUpgrade = result > 9
        resultNumber.append(Node(number: result%10))
    }
    
    return resultNumber
}


func toNodes(number: Int) -> [Node] {
    var value = number
    var nodes: [Node] = []
    if number <= 0 {
        return [Node(number: 0)]
    }
    while value > 0 {
        let node = Node(number: value%10)
        nodes.append(node)
        value = value/10
    }
    print("number = \(number), nodes = \(nodes)")
    return nodes
}

func indexNode(index: Int, number: [Node]) -> Node {
    guard index < number.count else {
        return Node(number: 0)
    }
    return number[index]
}

addTwoNumbers(342, 464)
addTwoNumbers(0, 0)
addTwoNumbers(1024, 976)

