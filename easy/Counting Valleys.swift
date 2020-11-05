/*Counting Valleys
*/

func countingValleys(steps: Int, path: String) -> Int {
    var s = 0
    let paths = Array(path)
    var res = 0
    for c in paths {
        if c == "U" {
            if s == -1 {
                res += 1
            }
            s += 1
        } else {
            s -= 1
        }
    }
    return res
}
let input1 = 8
let input2 = "UDDDUDUU"
print(countingValleys(steps: input1, path: input2))