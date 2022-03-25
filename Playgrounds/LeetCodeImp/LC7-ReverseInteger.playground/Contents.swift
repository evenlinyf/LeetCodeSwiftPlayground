import UIKit

func reverse(_ x: Int) -> Int {
    print("输入的整数 = \(x)")
    let isFu = x < 0
    var num = x
    if x < 0 {
        num *= -1
    }
    let numString = String(num)
    var reversedString = ""
    numString.forEach { char in
        reversedString = String(char) + reversedString
    }
    print("反转后的字符串 = \(reversedString)")
    let reversedInt =  Int(reversedString)! * (isFu ? -1 : 1)
    print("转换后的Int值 = \(reversedInt)")
    let boundary = Int(pow(2.0, 31.0))
    print(boundary)
    guard reversedInt >= (boundary * -1) && reversedInt < boundary else {
        print("超出边界条件")
        return 0
    }
    return Int(reversedInt)
}
let result = reverse(1563847412)
print("反转后的整数 = \(result)")


/**
 给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。

 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。

 假设环境不允许存储 64 位整数（有符号或无符号）。
  

 示例 1：

 输入：x = 123
 输出：321
 示例 2：

 输入：x = -123
 输出：-321
 示例 3：

 输入：x = 120
 输出：21
 示例 4：

 输入：x = 0
 输出：0
  

 提示：

 -231 <= x <= 231 - 1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-integer
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
