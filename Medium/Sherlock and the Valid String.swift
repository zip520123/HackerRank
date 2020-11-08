/*Sherlock and the Valid String*/

func isValid(s: String) -> String {
    var dict = [Character: Int]()
    for c in s {
        dict[c, default:0] += 1
    }
    
    var v1 = -Int.max
    for (_, value) in dict {
        v1 = value
        break
    }
    
    var v2 = v1
    for (_, value) in dict {
        if value != v1 {
            v2 = value
            break
        }
    }
    if v2 == v1 { return "YES" }
    
    for (_, value) in dict {
        if (value != v1 && value != v2) {
            return "NO"
        }
    }
    
    var v1Count = 0
    var v2Count = 0
    
    for (_, value) in dict {
        if (value == v1) {
            v1Count+=1
        } 
        if (value == v2) {
            v2Count += 1
        }
    }

    if (v1Count == 1) {
        if (v1 - 1 == v2 || v1 == 1) {
            return "YES"
        }
    } 
    if (v2Count == 1) {
        if (v2 - 1 == v1 || v2 == 1) {
            return "YES"
        }
    }
    
    return "NO"
    
}
// let input = "abcdefghhgfedecba"
// let input = "aaaabbcc"
let input = "aabbc"
print(isValid(s:input))