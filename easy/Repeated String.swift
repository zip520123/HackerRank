/*Repeated String*/
//time O(n) space O(1)
// func repeatedString(s: String, n: Int) -> Int {
//     let arrS = Array(s)
//     var i = 0
//     let scount = s.count
//     var res = 0
//     var currIndex = 0
//     while (currIndex < n) {
//         let c = arrS[i]
//         if c == "a" {
//             res += 1
//         }
//         i += 1
//         if (i == scount) {
//             i = 0
//         }
//         currIndex += 1
//     }
    
//     return res
// }

// time O(1) space O(s)
func repeatedString(s: String, n: Int) -> Int {
    let scount = s.count
    //3 * x <= 10
    //x <= 10 / 3
    // 10 % 3 
    var acount = 0
    for item in Array(s) {
        if item == "a" {
            acount += 1
        }
    }
    var res = (n / scount) * acount
    let rest = n % scount
    for c in Array(s)[0..<rest] {
        if c == "a" {
            res += 1
        }
    }
    return res
}

let input = "aba"
let input2 = 10

print(repeatedString(s: input, n: input2))