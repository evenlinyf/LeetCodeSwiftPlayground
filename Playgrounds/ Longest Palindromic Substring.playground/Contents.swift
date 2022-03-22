import UIKit

func longestPalindrome(_ s: String) -> String {
    if s.count == 1 {
        return s
    }
    
    let string = s as NSString
    var results: [String] = []
    
    var preStrings = ""
    
    for index in 1..<string.length {
        let pre = string.substring(with: NSRange(location: index - 1, length: 1))
        preStrings = pre + preStrings
        if index == string.length {
            print("end of the string")
            break
        }
        let next = string.substring(with: NSRange(location: index, length: 1))
        
        var midValue = ""
        //说明下一个不是和当前相同， 看看下下个是否一致
        if preStrings.hasPrefix(next) == false {
            midValue = string.substring(with: NSRange(location: index, length: 1))
        }
        let suf = string.substring(from: index + midValue.count)
        var length: Int = 0
        for i in 1..<string.length {
            if i <= preStrings.count && i <= suf.count {
                let prePre = (preStrings as NSString).substring(to: i)
                let surPre = (suf as NSString).substring(to: i)
                if prePre == surPre {
                    length = i
                }
            }
        }
        if length > 0 {
            let sufPan = (suf as NSString).substring(to: length)
            let result = sufPan.reduce(midValue, {String($1) + $0 + String($1)})
            results.append(result)
            //            print("result = \(result)")
        }
        
        //        print("pre = \(preStrings),mid = \(midValue), suf = \(suf)")
        
    }
    print(results)
    results = results.sorted(by: {$0.count > $1.count})
    return results.first ?? String(s.first!)
}

longestPalindrome("什么鬼上海自来水水来自海上拉路上看到积分")





//回文指的是正反念都一样， 如： 上海自来水来自海上

/**
 给你一个字符串 s，找到 s 中最长的回文子串。

  

 示例 1：

 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 示例 2：

 输入：s = "cbbd"
 输出："bb"
  

 提示：

 1 <= s.length <= 1000
 s 仅由数字和英文字母组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-palindromic-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
