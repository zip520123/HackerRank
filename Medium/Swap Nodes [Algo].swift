/*Swap Nodes [Algo]
*/
class TreeNode {
    var left: TreeNode? = nil
    var right: TreeNode? = nil
    var value: Int 
    init(_ value: Int) {
        self.value = value
    }
}
func swapNodes(indexes: [[Int]], queries: [Int]) -> [[Int]] {
    var res = [[Int]]()
    let root = TreeNode(1)
    var nodes = [root]
    
    for list in indexes {
        let curr = nodes.remove(at: 0)
        
        curr.left = list[0] == -1 ? nil : TreeNode(list[0])
        curr.right = list[1] == -1 ? nil : TreeNode(list[1])

        if curr.left != nil { nodes.append(curr.left!) }
        if curr.right != nil { nodes.append(curr.right!) }
        
    }
    //bfs  
    for k in queries {
        nodes = [root]
        var deep = 1
        while (nodes.isEmpty == false) {
            let temp = nodes
            nodes.removeAll()

            for node in temp {
                let left = node.left
                let right = node.right
                if deep % k == 0 { 
                    node.right = left
                    node.left = right
                }
                if left != nil {nodes.append(left!) }
                if right != nil {nodes.append(right!)}
            }    
            deep += 1
        }
        
        res.append(inorderTree(root))
    }
    
    return res
}

func inorderTree(_ root: TreeNode) -> [Int] {
    var res = [Int]()
    var nodes = [TreeNode]()
    var curr: TreeNode? = root
    while(nodes.isEmpty == false || curr != nil) {
        while curr != nil {  
            nodes.insert(curr!, at:0)
            curr = curr!.left
        }
        curr = nodes.remove(at:0)
        res.append(curr!.value)
        curr = curr!.right
    }
    return res
}

let input = [[2, 3], [-1, -1], [-1, -1]]
let input2 = [1, 1]
let output = [[3,1,2],[2,1,3]]
print(swapNodes(indexes: input, queries: input2) == output)

