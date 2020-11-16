/*Abbreviation*/
func abbreviation(a: String, b: String) -> String {
    var dp = [[Int]]()
    let arrA = Array(a)
    let arrB = Array(b)
    let acount = a.count
    let bcount = b.count
    for _ in 0...bcount{
        dp.append(Array(repeating: 0, count: acount + 1))
    }
    dp[0][0] = 1
    for i in 1...acount{
        let c = arrA[i-1]
        if c.asciiValue! >= 97 {
            dp[0][i] = dp[0][i-1]
        } else {
            dp[0][i] = 0
        }
        
    }
    
    for i in 1...bcount {
        for j in 1...acount {
            if arrA[j-1].asciiValue! >= 97 {
                if String(arrB[i-1]) == arrA[j-1].uppercased() {
                    dp[i][j] = max(dp[i-1][j-1], dp[i][j-1])
                } else {
                    dp[i][j] = dp[i][j-1]
                }
                
            } else {
                if arrB[i-1] == arrA[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = 0
                }
                
            }
            
        }
    }
    
    return dp[bcount][acount] == 1 ? "YES" : "NO"
    
}

// let input = "daBcd"
// let input2 = "ABC"

// let input = "AbcDE"
// let input2 = "AFDE"

let input = "DRFNLZZVHLPZWIupjwdmqafmgkg"
let input2 = "DRFNLZZVHLPZWI"
print(abbreviation(a: input, b: input2))