/*Jumping on the Clouds*/
//time O(N) space O(N)
func jumpingOnClouds(c: [Int]) -> Int {
    var arr = [0]
    if c.count >= 2 {
        if c[1] == 0 {
            arr.append(1)
        } else {
            arr.append(Int.max)
        }
    }
    
    for i in 2..<c.count {
        let item = c[i]
        if item == 1 {
            arr.append(Int.max)
        } else {
            arr.append(min(arr[i-1],arr[i-2]) + 1)
        }
    }

    return arr[arr.count - 1]
}

//time O(N) space O(1)

// func jumpingOnClouds(c: [Int]) -> Int {


// }

let input = [0,0,1,0,0,1,0]
// let input = [0,0,0,1,0,0]
print(jumpingOnClouds(c:input))

