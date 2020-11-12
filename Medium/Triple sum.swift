/*Triple sum*/
//time O(a*b*c) space O(a+b+c)
// func triplets(a: [Int], b: [Int], c: [Int]) -> Int {
//     var res = 0
//     let a = Array(Set(a))
//     let b = Array(Set(b))
//     let c = Array(Set(c))
//     for x in a {
//         for y in b {
//             for z in c {
//                 if (x<=y && y>=z) {
//                     res += 1
//                 }
//             }
//         }
//     }
//     return res
// }

//time O(n log n + b * (log a + log c)) space O(a+b+c)
func triplets(a: [Int], b: [Int], c: [Int]) -> Int {
    var res = 0
    let a = Array(Set(a)).sorted()
    let b = Array(Set(b)).sorted()
    let c = Array(Set(c)).sorted()
    let acount = a.count   
    let ccount = c.count
    for n in b {
         
        var left = 0, right = acount - 1
        while(left <= right) {
            let mid = left + (right - left) / 2
            if a[mid] < n {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        if left < acount && a[left] == n {
            left += 1
        } 
        
        let p = left
        
        left = 0; right = ccount - 1
        while(left <= right) {
            let mid = left + (right - left) / 2
            if c[mid] < n {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        if left < ccount && c[left] == n {
            left += 1
        } 
        let r = left
        
        res += p * r
    }
    return res
}
// let input = [1,4,5]
// let input2 = [2,3,3]
// let input3 = [1,2,3]
// let input = [1,3,5]
// let input2 = [2,3]
// let input3 = [1,2,3]
// let input = [1,4,5]
// let input2 = [2,3,3]
// let input3 = [1,2,3]

let input = [1,3,5,7]
let input2 = [5,7,9]
let input3 = [7,9,11,13]



print(triplets(a:input, b:input2, c:input3))
