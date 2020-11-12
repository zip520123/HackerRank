/*Benford's law*/
// func f1(_ n:Int) -> Int {
//     if n <= 0 { return 0 }
//     if n == 1 { return 1 }
//     return f1(n-1) + f1(n-2)
// }
// print(f1(10))
// func fibonacci(_ n: Int) -> Int {
//     var arr = [0,1]
//     for i in 2...n {
//         arr.append(arr[i-1]+arr[i-2])
//     }
//     return arr[n]
// }
import Foundation
struct BigInt {
    let value: String
    init(_ value: String) {
        self.value = value
    }
    static func +(lhs: BigInt, rhs: BigInt) -> BigInt {
        var s1 = ""
        var s2 = ""
        if Array(lhs.value).count > Array(rhs.value).count {
            s1 = lhs.value
            s2 = rhs.value
        } else {
            s1 = rhs.value
            s2 = lhs.value
        }
        let a1 = Array(s1).reversed().map {String($0)}
        let a2 = Array(s2).reversed().map {String($0)}
    
        var res = [String]()
        var carry = 0
        let a1count = a1.count
        let a2count = a2.count
        var i = 0

        while(i<a1count) {
            
            let left = Int(a1[i])!
            var right = 0
            if i < a2count {
                right = Int(a2[i])!
            }
            let sum = left + right + carry
            if sum >= 10 {
                carry = 1
            } else {
                carry = 0
            }
            res.append(String(sum % 10))
            i+=1
        }
        if carry > 0 {
            res.append(String(carry))
        }
        let v = res.reversed().map {String($0)}.joined(separator:"")
        
        return BigInt(v)
    }
}

func f3(_ n: Int) {
    var a = BigInt("0")
    var b = BigInt("1")
    var res = BigInt("0")
    var dict = [Character:Int]()

    for _ in 2...n {
        res = a+b
        let s = Array(res.value)[0]
        dict[s,default:0] += 1
        a = b
        b = res
    }
    caculate(dict)
    print(res.value, res.value.count)
}

func caculate(_ dict: [Character:Int]) {
    var sum = 0
    for (_,value) in dict {
        sum += value
    }

    for i in 1...9 {
        let s = Array(String(i))[0]
        let value = dict[s]!
        let d = Double(Double(i+1) / Double(i))
        let ben = log10(d)
        print("\(i) : \(value) ", terminator: "| ")

        let r = Double(value) / Double(sum)
        let rs = String(format:"%.4f",r)
        print(rs, terminator: " | ")
        let benS = String(format:"%.4f", ben)
        print(benS)
        
    }
    print(dict)

}
f3(3000)