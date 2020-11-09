/*Max Min*/
//time O(n log n) space O(arr + k)
func maxMin(k: Int, arr: [Int]) -> Int {
    let arr = arr.sorted()
    var window = [Int]()
    var min = Int.max
    for item in arr {
        window.append(item)
        if window.count == k {
            let cmin = window[0]
            let cmax = window[window.count - 1] 
            let value = cmax - cmin
            min = Swift.min(value, min)
            window.remove(at:0)
        }

    }
    
    return min
}
// let input = 3
// let input2 = [10, 100, 300, 200, 1000, 20, 30]

let input = 4
let input2 = [1, 2, 3, 4, 10, 20, 30, 40, 100, 200]
print(maxMin(k: input, arr: input2))