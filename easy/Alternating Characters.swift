/*Alternating Characters*/

func alternatingCharacters(s: String) -> Int {
    let arr = Array(s)
    var p = arr[0]
    var res = 0
    for i in 1..<arr.count {
        let c = arr[i]
        if p == c {
            res += 1
        } else {
            p = c
        }
    }
    return res

}


