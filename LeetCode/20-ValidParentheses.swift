//: [Previous](@previous)
/**
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/valid-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

//如果字符数不是偶数， 必定不匹配
//迭代string,
//如果是右括号, 查看栈顶元素是否是匹配的左括号
//如果是， 栈顶元素出栈
//如果不是就不匹配, 如果是左括号， 入栈
//如果栈内还有元素， 那么说明还有未匹配的左括号， 字符串无效
func isValid(_ s: String) -> Bool {
    guard s.count % 2 == 0 else { return false }
    let map: [Character: Character] = ["}": "{", ")": "(", "]": "["]
    var stack: [Character] = []
    for c in s {
        if map.keys.contains(c) {
            if stack.last == map[c] {
                stack.removeLast()
            } else {
                return false
            }
        } else {
            stack.append(c)
        }
    }
    return stack.isEmpty
}

//😂
func isValidString(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        var str = s
        while str.contains("[]") || str.contains("()") || str.contains("{}") {
            str = str.replacingOccurrences(of: "[]", with: "").replacingOccurrences(of: "()", with: "").replacingOccurrences(of: "{}", with: "")
        }
        return str.count == 0
}

isValidString("[[]]]]")



//isValid("[[(())]]")

isValid("[[]]")

//isValid("{{}]]")
//isValid("[]")


