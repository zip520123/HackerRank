/*Extra Long Factorials

The factorial of the integer , written , is defined as:

Calculate and print the factorial of a given integer.

For example, if , we calculate  and get .

Function Description

Complete the extraLongFactorials function in the editor below. It should print the result and return.

extraLongFactorials has the following parameter(s):

n: an integer
Note: Factorials of  can't be stored even in a  long long variable. Big integers must be used for such calculations. Languages like Java, Python, Ruby etc. can handle big integers, but we need to write additional code in C/C++ to handle huge values.

We recommend solving this challenge using BigIntegers.

Input Format

Input consists of a single integer 

Constraints


Output Format

Print the factorial of .

Sample Input


Sample Output


Explanation


*/

func extraLongFactorials(n: Int) -> Void {
    
    var res = Num(string:"1")
    for i in 1...n {
        res = res * Num(string:String(i))
    }
    
    print(res.string)
    
}
extraLongFactorials(n: 25)

struct Num {
    var string: String = "0"
    static func *(left: Num, right: Num) -> Num {
        var carry = 0
        let v1 = longerString(left.string,right.string)
        var v2 = right.string
        if v2 == v1 { v2 = left.string }
        let v1Arr = Array(v1).reversed().map {String($0)}
        let v2Arr = Array(v2).reversed().map {String($0)}
        var arr = [0]
        
        for i1 in 0..<v2Arr.count {
            for i2 in 0..<v1Arr.count {
                let n1 = Int(String(v2Arr[i1]))!
                let n2 = Int(String(v1Arr[i2]))!
                let n = n1 * n2
                
                let index = i1 + i2
                if (index >= arr.count) {
                    arr.append(0)
                }
                let sum = arr[index] + carry + n 
                
                carry = sum / 10 
                arr[index] = sum % 10
            }
            if carry > 0 {
                arr.append(carry)
            }
            carry = 0
            
        }
        let res = Num(string:arr.reversed().map{String($0)}.joined(separator:""))
        
        return res
    }

    static func longerString(_ s1: String, _ s2: String) -> String {
        return s1.count > s2.count ? s1 : s2
    }
}



func test1() {
    let a = Num(string: "26")
    let b = Num(string: "169")
    
    print((a*b).string == "4394")
    
}

func test2() {
    let a = Num(string: "169")
    let b = Num(string: "26")


    print((a*b).string == "4394")
}

test1() 
