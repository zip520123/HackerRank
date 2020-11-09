/*Minimum Absolute Difference in an Array
*/
//time O(n^2) space O(1)
// func minimumAbsoluteDifference(arr: [Int]) -> Int {
//     var min = Int.max
//     let acount = arr.count
//     for i in 0..<acount-1 {
//         for j in i+1..<acount {
//             let value = abs(arr[i] - arr[j])
//             if value < min {
//                 min = value
//             }
//         }
//     }
//     return min
// } 
//time O(n log n) space O(n)
func minimumAbsoluteDifference(arr: [Int]) -> Int {
    let arr = arr.sorted()
    var min = Int.max
    for i in 0..<arr.count-1 {
        let value = abs(arr[i] - arr[i+1])
        if value < min {
            min = value
        }
    }

    return min
}

// let input = [3,-7,0]
let input = [-59,-36,-13,1,-53,-92,-2,-96,-54,75]
// let input = [1,2,2]
// let input = [1,-3,71,68,17]
print(minimumAbsoluteDifference(arr: input) )