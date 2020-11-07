/*Sherlock and Anagrams*/
// func sherlockAndAnagrams(s: String) -> Int {
//     var dict = [String: Int]()
//     for len in 1..<s.count {
//         for i in 0...(s.count-len) {
            
//             let word = Array(s)[i..<i+len]
//             let key = word.sorted().map {String($0)}.joined(separator:"")
//             dict[key] = dict[key] == nil ? 1 : dict[key]! + 1
//         }
//     }
    
//     var res = 0
//     for (key, value) in dict {
//         res += value * (value - 1) / 2
//     }
//     return res
// }

func sherlockAndAnagrams(s: String) -> Int {
    var dict = [String: Int]()
    for len in 1..<s.count {
        for i in 0...(s.count - len){
            let word = Array(s)[i..<i+len]
            let key = word.sorted().map{String($0)}.joined(separator:"")
            dict[key, default:0] += 1
        }
    }
    var res = 0
    for (_ , value) in dict {
        res += value * (value - 1) / 2
    }
    return res
}
let input = "abba"
print(sherlockAndAnagrams(s: input))