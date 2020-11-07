/*Two Strings*/
func twoStrings(s1: String, s2: String) -> String {
    var dict = [String:Int]()
    for c in s1 {
        dict[String(c)] = 1
    }
    for c in s2 {
        if dict[String(c)] != nil {
            return "YES"
        }
    }
    return "NO"
}
// let input1 = "Hello"
// let input2 = "world"
let input1 = "hi"
let input2 = "world"
print(twoStrings(s1:input1, s2:input2))