//: [Previous](@previous)
/**
 给你一个二叉树的根节点 root ，判断其是否是一个有效的二叉搜索树。

 有效 二叉搜索树定义如下：

 节点的左子树只包含 小于 当前节点的数。
 节点的右子树只包含 大于 当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/validate-binary-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */
import Foundation

var values: [Int] = []

//[5,4,6,null,null,3,7]
//[2,2,2]
// 36ms
func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    inOrderTree(root)
    return values == values.sorted() && Set(values).count == values.count
}

func inOrderTree(_ root: TreeNode?) {
    guard let root = root else { return }
    inOrderTree(root.left)
    values.append(root.val)
    inOrderTree(root.right)
}



//32ms beat 99.18%
//14.7MB beat 29.22%
func isValidBinarySearchTree(_ root: TreeNode?) -> Bool {
    func isBST(_ node: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        guard let node = node else { return true }
        guard node.val < max && node.val > min else { return false }
        return isBST(node.left, min, node.val) && isBST(node.right, node.val, max)
    }
    return isBST(root, Int.min, Int.max)
}



