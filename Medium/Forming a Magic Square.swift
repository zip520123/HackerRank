/*Forming a Magic Square
We define a magic square to be an  matrix of distinct positive integers from  to  where the sum of any row, column, or diagonal of length  is always equal to the same number: the magic constant.

You will be given a  matrix  of integers in the inclusive range . We can convert any digit  to any other digit  in the range  at cost of . Given , convert it into a magic square at minimal cost. Print this cost on a new line.

Note: The resulting magic square must contain distinct integers in the inclusive range .

Example

$s = [[5, 3, 4], [1, 5, 8], [6, 4, 2]]

The matrix looks like this:

5 3 4
1 5 8
6 4 2
We can convert it to the following magic square:

8 3 4
1 5 9
6 7 2
This took three replacements at a cost of .

Function Description

Complete the formingMagicSquare function in the editor below.

formingMagicSquare has the following parameter(s):

int s[3][3]: a  array of integers
Returns

int: the minimal total cost of converting the input square to a magic square
Input Format

Each of the  lines contains three space-separated integers of row .

Constraints

Sample Input 0

4 9 2
3 5 7
8 1 5
Sample Output 0

1
Explanation 0

If we change the bottom right value, , from  to  at a cost of ,  becomes a magic square at the minimum possible cost.

Sample Input 1

4 8 2
4 5 7
6 1 6
Sample Output 1

4
Explanation 1

Using 0-based indexing, if we make

-> at a cost of 
-> at a cost of 
-> at a cost of ,
then the total cost will be .
*/
func checkIfMagicSquare(s: [Int]) -> Bool {
    
    var count = 0
    for i in 0..<3 {
        count += s[i]
    }
    if count != 15 { return false }
    count = 0
    for i in 3..<6 {
        count += s[i]
    }
    if count != 15 { return false }
    count = 0
    for i in 6..<9 {
        count += s[i]
    }
    if count != 15 { return false }
    var col1 = 0, col2 = 0, col3 = 0

    var i = 0
    while(i<9) {
        if(i % 3 == 0) {
            col1 += s[i]
        }
        if(i % 3 == 1) {
            col2 += s[i]
        }
        if(i % 3 == 2) {
            col3 += s[i]
        }
        i+=1
    }
    if col1 != 15 || col2 != 15 || col3 != 15 { return false }
    

    var matrix = arrToMatrix(s)
    
    count = 0
    for i in 0..<3 {
        count += matrix[i][i]
    }
    if count != 15 { return false }

    count = 0
    i = matrix.count - 1 
    var j = 0
    while(i >= 0) {
        count += matrix[j][i]
        j+=1
        i-=1
    }
    if count != 15 { return false }
    return true
}
func arrToMatrix(_ s: [Int]) -> [[Int]] {
    var matrix = [[Int]]()
    var arr = [Int]()
    var i = 0 
    while(i<9) {
        let item = s[i]
        if(i % 3 == 0 && i != 0) {
            matrix.append(arr)
            arr = [Int]()    
        }
        arr.append(item)
        i+=1
    }
    matrix.append(arr)
    return matrix
}
func matrixToArr(_ s: [[Int]]) -> [Int] {
    var res = [Int]()
    for row in s {
        for item in row {
            res.append(item)
        }
    }
    return res
}

func formingMagicSquare(s: [[Int]]) -> Int {
    var magicS = [[Int]]()
    magicS = [[2, 7, 6, 9, 5, 1, 4, 3, 8], [2, 9, 4, 7, 5, 3, 6, 1, 8], [4, 3, 8, 9, 5, 1, 2, 7, 6], [4, 9, 2, 3, 5, 7, 8, 1, 6], [6, 1, 8, 7, 5, 3, 2, 9, 4], [6, 7, 2, 1, 5, 9, 8, 3, 4], [8, 1, 6, 3, 5, 7, 4, 9, 2], [8, 3, 4, 1, 5, 9, 6, 7, 2]]
    // let arr = [1,2,3,4,5,6,7,8,9]
    
    // func dfs(_ last: [Int],_ curr: [Int]) {
    //     if (last.count == 0) {
    //         if checkIfMagicSquare(s: curr) == true {
    //             magicS.append(curr)
    //         }
    //         return
    //     }
    //     var tLast = last
    //     var tCurr = curr
    //     var i = 0
    //     while(i<last.count) {
    //         let n = tLast.remove(at:i)
    //         tCurr.append(n)
    //         dfs(tLast,tCurr)
    //         tCurr.removeLast()
    //         tLast.insert(n,at:i)
    //         i += 1
    //     }
    // }
    // dfs(arr,[])
    
    var min = Int.max
    let currArr = matrixToArr(s)
    for currMagicS in magicS {
        var localCost = 0
        var i = 0
        while(i<currArr.count) {
            localCost += abs(currArr[i] - currMagicS[i])
            i+=1
        }
        min = Swift.min(min,localCost)
    }
    return min
}
let input = [[5, 3, 4], [1, 5, 8], [6, 4, 2]]
print(formingMagicSquare(s:input))