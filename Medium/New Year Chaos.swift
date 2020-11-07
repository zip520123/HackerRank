/*New Year Chaos*/
func minimumBribes(q: [Int]) -> Void {
    var res = 0
    for i in (0..<q.count).reversed() {
        if (q[i] - (i + 1) > 2) {
            print("Too chaotic")
            return 
        }
        var j = max(0, q[i] - 2)
        while(j<i) {
            if (q[j] > q[i]) {
                res += 1
            }
            j+=1
        }
    }
    print(res)
}
// let input1 = [2,1,5,3,4]
let input1 = [2,5,1,3,4]
minimumBribes(q: input1)