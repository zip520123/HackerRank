/*Hash Tables: Ransom Note

*/
func checkMagazine(magazine: [String], note: [String]) -> Void {
    var dict = [String: Int]()
    for c in magazine {
        dict[c,default:0] += 1
    }
    
    for c in note {
        dict[c,default:0] -= 1
        if dict[c]! < 0 {
            print("No")
            return
        }
    }
    print("Yes")
}