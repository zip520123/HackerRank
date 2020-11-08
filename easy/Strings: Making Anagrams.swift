/*Strings: Making Anagrams*/
//time O(a + b) space O(a)
func makeAnagram(a: String, b: String) -> Int {
    var dict = [Character: Int]()
    for c in a {
        dict[c,default:0] += 1
    }
    var acount = a.count
    var res = 0
    for c in b {
        if dict[c] == nil {
            res += 1
        } else {
            if dict[c]! > 0 {
                acount -= 1
            } else {
                res += 1
            }
            dict[c]! -= 1
            
        }
    }
    res += acount
    return res
}