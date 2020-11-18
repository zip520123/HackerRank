/*Count Triplets*/
//time O(n) space O(n)
func countTriplets(arr: [Int], r: Int) -> Int {
    var res = 0

    var leftDict = [Int:Int]()
    var rightDict = [Int:Int]()

    for n in arr {
        rightDict[n, default:0] += 1
    }

    for j in arr {
        rightDict[j, default:0] -= 1

        if j % r == 0 {
            let i = leftDict[j/r, default:0]
            let k = rightDict[j*r, default:0]
            res += i * k
        }
        
        leftDict[j, default:0] += 1   
    }
    return res
}

// let input = [1,3,9,9,27,81]
// let input2 = 3

let input = [1,2,2,4]
let input2 = 2
print(countTriplets(arr: input, r: input2))