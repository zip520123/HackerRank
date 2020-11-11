/*Hash Tables: Ice Cream Parlor

*/
//time O(n) space O(n)
func whatFlavors(cost: [Int], money: Int) -> Void {
    var dict = [Int: Int]()
    for (i,item) in cost.enumerated() {
        let value = money - item
        if (dict[value] != nil) {
            print(dict[value]! + 1, (i + 1))
            return
        }
        dict[item] = i
    }

}

let input = [1, 4, 5, 3, 2] 
let input2 = 4

// [2, 2, 4, 3] 4

print(whatFlavors(cost: input, money:input2))