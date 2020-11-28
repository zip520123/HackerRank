/*Frequency Queries*/
// func freqQuery(queries: [[Int]]) -> [Int] {
//     var dict = [Int:Int]()
//     var res = [Int]()
//     queryLoop: for query in queries {
//         let operation = query[0]
//         let value = query[1]
//         switch operation {
//             case 1:
//                 dict[value, default:0] += 1
//             case 2:
//                 dict[value, default:1] -= 1
//                 if dict[value] == 0 {
//                     dict[value] = nil
//                 }
//             case 3:
//                 for (key, frequency) in dict {
//                     if value == frequency { 
//                         res.append(1)
//                         continue queryLoop
//                     }
//                 }
//                 res.append(0)
//             default:
//                 break
//         }
//     }
//     return res

// }

func freqQuery(queries: [[Int]]) -> [Int] {
    var dict = [Int:Int]()
    var dict2 = [Int:Int]()
    var res = [Int]()
    for query in queries {
        let operation = query[0]
        let value = query[1]
        switch operation {
            case 1:
                if dict2[dict[value, default:0], default:0] > 0 {
                    dict2[dict[value, default:0], default:0] -= 1
                }
                
                dict[value, default: 0] += 1
                dict2[dict[value]!, default: 0] += 1
            case 2:
                if dict2[dict[value, default:0], default:0] > 0 {
                    dict2[dict[value, default:0], default:0] -= 1
                }
                if dict[value,default: 0] > 0 {
                    dict[value,default: 0] -= 1
                } 
                
                dict2[dict[value,default: 0], default: 0] += 1
            case 3:
                if dict2[value,default: 0] > 0 {
                    res.append(1)
                } else {
                    res.append(0)
                }
            default:
                break
        }
    }
    return res
}

