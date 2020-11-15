/*Common Child*/
// func commonChild(s1: String, s2: String) -> Int {
//     let s1count = s1.count
//     let s2count = s2.count
//     let s1a = Array(s1)
//     let s2a = Array(s2) 
//     var res = 0
//     var s = ""
//     for (i, c1) in s1.enumerated() {
        
//         out:for (j,c2) in s2.enumerated() {
//             if c1 == c2 {
//                 var localMax = 1
//                 var p1 = i + 1
//                 var p2 = j + 1
//                 var locals = String(c1)
//                 while(p1<s1count) {
//                     var tp2 = p2
//                     while(tp2 < s2count) {
//                         if s1a[p1] == s2a[tp2] {
//                             locals.append(s1a[p1]) 
//                             localMax += 1
//                             p2 = tp2 + 1
//                             break
//                         } else {
//                             tp2 += 1
//                         }
//                     }
                    
//                     p1 += 1
//                 }
//                 res = max(res, localMax)
//                 s = locals.count > s.count ? locals : s
//                 break out
//             }
            

//         }
//     }
//     print(s)
//     return res
// }
//time O(s1 * s2) space O(s1 * s2)
func commonChild(s1: String, s2: String) -> Int {
    let s1count = s1.count
    let s2count = s2.count
    let s1a = Array(s1)
    let s2a = Array(s2) 
    var dp : [[Int]] = []

    for _ in 0...s2count {
        let arr = Array(repeating:0, count:s1count + 1)
        dp.append(arr)
    }
    
    for i in 1...s2count {
        for j in 1...s1count {
            let c1 = s1a[i - 1]
            let c2 = s2a[j - 1]
            
            if c1 == c2 {
                dp[i][j] = dp[i-1][j-1] + 1
            } else {
                dp[i][j] = max(dp[i-1][j],dp[i][j-1])
            }
            
        }
    }
    return dp[s2count][s1count]
}

// let input =  "SHINCHAN"
// let input2 = "NOHARAAA"

// let input =  "AA"
// let input2 = "BB"

// let input =  "ABCDEF"
// let input2 = "FBDAMN"

let input =  "HARRY"
let input2 = "SALLY"

// let input =  "WEWOUCUIDGCGTRMEZEPXZFEJWISRSBBSYXAYDFEJJDLEBVHHKS"
// let input2 = "FDAGCXGKCTKWNECHMRXZWMLRYUCOCZHJRRJBOAJOQJZZVUYXIC"



print(commonChild(s1: input, s2: input2))