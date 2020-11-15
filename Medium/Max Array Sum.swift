/*Max Array Sum*/

func maxSubsetSum(arr: [Int]) -> Int {
    var incl = arr[0]
    var excl = 0
    for i in 1..<arr.count {
        let n = arr[i]
        let t = max(n, n + excl, incl)
        excl = incl
        incl = t
    }
    return incl

}