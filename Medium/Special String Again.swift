/*Special String Again*/
//time O(n^2) space O(n)
func substrCount(n: Int, s: String) -> Int {
    
    var res = s.count
    let scount = s.count
    let arr = Array(s)
    //aaaa
    var i = 0
    while(i<scount) {
        let c = arr[i]
        var j = i + 1
        while(j<scount && c == arr[j]) {
            res += 1
            j+=1
        }
        i+=1
    }
    
    //point
    //asasd
    i = 0
    while(i<scount) {
        var left = i - 1
        var right = i + 1
        if left>=0 && right<scount && arr[left] == arr[right] && arr[i] != arr[left] {
            let t = arr[left]
            while (left>=0 && right<scount && arr[left] == arr[right] && arr[left] == t) {
                res += 1
                left -= 1
                right += 1
            }
        }
        i+=1
    }
    return res

}
// let input = "aaaa"
// let input = "asasd"
let input = "abcbaba"
print(substrCount(n:0, s: input))
