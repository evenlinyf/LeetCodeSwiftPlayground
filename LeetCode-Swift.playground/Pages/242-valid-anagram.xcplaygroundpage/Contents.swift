/**
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

 注意：若 s 和 t 中每个字符出现的次数都相同，则称 s 和 t 互为字母异位词。
 输入: s = "anagram", t = "nagaram"
 输出: true
 
 示例 2:

 输入: s = "rat", t = "car"
 输出: false
 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/valid-anagram
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
//排序法 20ms
func isAnagram(_ s: String, _ t: String) -> Bool {
    return s.sorted() == t.sorted()
//    return s.map{$0}.sorted() == t.map{$0}.sorted()
}

//20ms
func isAnagramTwoMapWay(_ s: String, _ t: String) -> Bool {
    var sMap: [Character: Int] = [:]
    var tMap: [Character: Int] = [:]
    s.forEach {sMap[$0] != nil ? (sMap[$0] = sMap[$0]! + 1) : (sMap[$0] = 1)}
    t.forEach {tMap[$0] != nil ? (tMap[$0] = tMap[$0]! + 1) : (tMap[$0] = 1)}
    return sMap == tMap
}

//16ms
func isAnagramOneMapWay(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    var map: [Character: Int] = [:]
    for idx in s.indices {
        let sc = s[idx]
        if let count = map[sc] {
            map[sc] = count + 1
        } else {
            map[sc] = 1
        }
        
        let tc = t[idx]
        if let tCount = map[tc] {
            map[tc] = tCount - 1
        } else {
            map[tc] = -1
        }
    }
    for value in map.values {
        if value != 0 {
            return false
        }
    }
    return true
}

//4ms
func isAnagramArrayWay(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    var arr = Array(repeating: 0, count: 26)
    for char in s.unicodeScalars {
        let idx = Int(char.value - "a".unicodeScalars.first!.value)
        arr[idx] += 1
    }
    
    for char in t.unicodeScalars {
        let idx = Int(char.value - "a".unicodeScalars.first!.value)
        arr[idx] -= 1
        if arr[idx] < 0 { return false }
    }
    print(arr)
    return true
}

//isAnagramOneMapWay("anagram", "nagaram")
//
//isAnagramOneMapWay("rat", "car")

isAnagramArrayWay("anagram", "nagaram")

isAnagramArrayWay("rat", "car")
