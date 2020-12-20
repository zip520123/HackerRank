/*Merge Sort: Counting Inversions
*/
//time O(n^2) space O(1)
// func countInversions(arr: [Int]) -> Int {
//     var arr = arr
//     let acount = arr.count
//     var i = 0
//     var res = 0
//     while(i<acount - 1) {
//         var j = i+1
//         while(j<acount) {
//             if arr[i] > arr[j] {
//                 res += 1
//             }
//             j += 1
//         }
//         i += 1
//     }
//     return res
// }

//time O(n log n) space O()
func countInversions(arr: [Int]) -> Int {
    var count = 0
    func slice(_ arr: [Int]) -> [Int] {
        let acount = arr.count
        if acount == 0 { return [] }
        if acount == 1 { return arr }
        let mid = acount / 2
        let left = slice(Array(arr[0..<mid]))
        let right = slice(Array(arr[mid..<acount]))
        var index1 = 0, index2 = 0
        let lcount = left.count
        let rcount = right.count
        var res = [Int]()
        while(index1 < lcount && index2 < rcount) {
            if left[index1] <= right[index2] {
                res.append(left[index1])
                index1 += 1
            } else {
                res.append(right[index2])
                count += (lcount - index1)
                index2 += 1
            }
        }

        if index1 < lcount {
            res += left[index1..<lcount]
        }

        if index2 < rcount {
            res += right[index2..<rcount]
        }

        return res
    }
    print(slice(arr))
    return count
}
let input = [1,20,6,7,5,8,11,3,14]
print(countInversions(arr: input))