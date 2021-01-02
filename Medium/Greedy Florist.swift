/*Greedy Florist*/
func getMinimumCost(k: Int, c: [Int]) -> Int {
    let arr = c.sorted { $0 > $1 }
    let count = c.count
    var i = 0
    var res = 0
    
    while i < count {
        let x = i / k
        let prices = (x + 1) * arr[i]
        res += prices
        i+=1
    }
    return res
}

let input = [1,3,5,7,9]
let input2 = 3
print(getMinimumCost(k: input2, c:input))