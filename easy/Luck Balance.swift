/*Luck Balance*/
func luckBalance(k: Int, contests: [[Int]]) -> Int {
    let contests = contests.sorted { left, right in
        if left[1] == right[1] {
            if left[1] == 0 {
                return left[0] > right[0]
            } else {
                return left[0] > right[0]
            }
        } else {
            return left[1] > right[1]
        }
    }
    var res = 0
    var k = k
    var i = 0
    let count = contests.count
    while k > 0 {
        res += contests[i][0]
        k -= 1
        i += 1
    }
    while i < count {
        if contests[i][1] == 0 {
            res += contests[i][0]
        } else {
            res -= contests[i][0]
        }
        i+=1
    }
    return res
}

let input1 = 3
let input2 = [ [10, 0],[5, 1], [2, 1], [1, 1], [8, 1], [5, 0]]

print(luckBalance(k:input1, contests:input2))