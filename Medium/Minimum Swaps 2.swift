/*Minimum Swaps 2*/
//time O(n^2) space O(arr)
// func minimumSwaps(arr: [Int]) -> Int {
//     var arr = arr
//     var res = 0
//     for i in 0..<arr.count {
//         let currNum = i + 1
//         if (arr[i] != currNum) {
//             for j in (i+1)..<arr.count {
//                 if arr[j] == currNum {
//                     (arr[i], arr[j]) = (arr[j],arr[i])
//                     res += 1
//                     break
//                 }
//             }
//         }
//     }
//     return res
// }

//time O(n) space O(arr)
func minimumSwaps(arr: [Int]) -> Int {
    var arr = arr
    var res = 0
    var i = 0
    while(i<arr.count) {
        let currNum = i + 1
        if (arr[i] != currNum) {
            (arr[i], arr[arr[i] - 1]) = (arr[arr[i] - 1], arr[i])
            res += 1
            i-=1
        }
        i+=1
    }
   
    return res
}
let input = [4,3,1,2]
// let input = [1,3,5,2,4,6,7]
print(minimumSwaps(arr: input))