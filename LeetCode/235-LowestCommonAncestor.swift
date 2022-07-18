/**
 给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/lowest-common-ancestor-of-a-binary-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     
 */

import Foundation

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root, let p = p, let q = q else { return nil }
    //如果两个节点的值都小于根节点的值， 那么公共祖先就在左子树中
    if p.val < root.val && q.val < root.val {
        return lowestCommonAncestor(root.left, p, q)
    }
    //如果两个节点的值都大于根节点的值， 那么公共祖先就在右子树中
    if p.val > root.val && q.val > root.val {
        return lowestCommonAncestor(root.right, p, q)
    }
    //如果p和q的节点值一个大于根节点一个小于根节点， 说明根节点就是左右子树的公共祖先
    return root
}
