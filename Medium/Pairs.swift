/*Pairs*/
// time O(arr) space O(arr)
func pairs(k: Int, arr: [Int]) -> Int {
    var dict = [Int:Int]()
    for item in arr {
        dict[item, default:0] = 1
    }
    var res = 0
    for item in arr {
        let target = item + k
        if dict[target] != nil {
            res += 1
        }
    }
    return res
}

let input = [1,5,3,4,2  ]
let input2 = 2
print(pairs(k:input2, arr:input))