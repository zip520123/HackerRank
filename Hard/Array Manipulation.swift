/*Array Manipulation*/
//time O(n * (b-a)) space O(n)
func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    var arr = Array(repeating:0, count: n)
    var res = 0
    for querie in queries {
        let a = querie[0] - 1, b = querie[1] - 1, k = querie[2]
        for i in a...b {
            arr[i] += k
            res = max(res,arr[i])
        }
        
    }
    return res
}

//time O(n + q) space O(n)
func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    var arr = Array(repeating:0, count: n)
    
    for querie in queries {
        let a = querie[0] - 1, b = querie[1] - 1, k = querie[2]
        arr[a] += k
        if b + 1 < n {
            arr[b+1] -= k
        }
    }
    var res = 0
    var sum = 0
    for item in arr {
        sum += item
        res = max(res, sum)
    }
    return res
}