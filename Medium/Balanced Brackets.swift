/*Balanced Brackets*/
func isBalanced(s: String) -> String {
    var arr : [Character] = []
    for c in s {
        switch c {
            case "[","(","{":
                arr.append(c)
            case "]":
                guard let c1 = arr.last, c1 == "[" else { return "NO" }
                arr.removeLast()
            case ")":
                guard let c1 = arr.last, c1 == "(" else { return "NO" }
                arr.removeLast()
            
            case "}":
                guard let c1 = arr.last, c1 == "{" else { return "NO" }
                arr.removeLast()
            default: 
                break
        }
    }
    
    return arr.count == 0 ? "YES" : "NO"
}

let input = "{[()]}"
print(isBalanced(s:input))

