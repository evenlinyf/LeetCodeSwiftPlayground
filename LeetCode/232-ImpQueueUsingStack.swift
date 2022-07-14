//: [Previous](@previous)
/**
 用栈实现队列
 请你仅使用两个栈实现先入先出队列。队列应当支持一般队列支持的所有操作（push、pop、peek、empty）：

 实现 MyQueue 类：

 void push(int x) 将元素 x 推到队列的末尾
 int pop() 从队列的开头移除并返回元素
 int peek() 返回队列开头的元素
 boolean empty() 如果队列为空，返回 true ；否则，返回 false
 说明：

 你 只能 使用标准的栈操作 —— 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。
 你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/implement-queue-using-stacks
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class MyQueue {
    
    var stackIn: [Int] = []
    var stackOut: [Int] = []

    init() {
    }
    
    func push(_ x: Int) {
        stackIn.append(x)
    }
    
    func pop() -> Int {
        guard empty() == false else { return 0 }
        if stackOut.isEmpty {
            while let last = stackIn.last {
                stackOut.append(last)
                stackIn.removeLast()
            }
        }
        let popResult = stackOut.last!
        stackOut.removeLast()
        return popResult
    }
    
    func peek() -> Int {
        guard empty() == false else { return 0 }
        if stackOut.isEmpty {
            while let last = stackIn.last {
                stackOut.append(last)
                stackIn.removeLast()
            }
        }
        return stackOut.last!
    }
    
    func empty() -> Bool {
        return stackIn.isEmpty && stackOut.isEmpty
    }
}

// in 2 3 4
// out 4 3 2
let queue = MyQueue()
queue.push(2)
queue.push(3)
queue.push(4)
let result = queue.pop()
let peek = queue.peek()
let empty = queue.empty()


/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */

