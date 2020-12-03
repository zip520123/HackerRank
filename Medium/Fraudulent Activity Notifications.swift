/*Fraudulent Activity Notifications
*/
//time O(n* n log n) space O(n)
// func activityNotifications(expenditure: [Int], d: Int) -> Int {
//     var arr = [Int]()
//     var res = 0
//     for (i,n) in expenditure.enumerated() {
//         if (i >= d) {
//             let arr2 = arr.sorted()
//             if d % 2 == 1 {
//                 let m = d / 2
//                 if n >= arr2[m] * 2 {
//                     res += 1
//                 }
//             } else {
//                 let m = d / 2 
//                 let r = (Double(arr2[m]) + Double(arr2[m - 1])) / 2
//                 if Double(n) >= r * 2 {
//                     res += 1
//                 }
//             }
//             arr.remove(at: 0)
//         }
//         arr.append(n)
//     }
//     return res
// }
//time O(n + n * d / 2)
func activityNotifications(expenditure: [Int], d: Int) -> Int {
    var countingList = Array<Int>(repeating:0, count:200)
    var end = d
    for i in 0..<end {
        countingList[expenditure[i]] += 1
    }
    
    var notifications = 0
    var medianPosition = d / 2
    if d % 2 == 0 {
    } else {
        medianPosition = d / 2 + 1
    }

    func getMedian() -> Double {
        var counter = 0, left = 0
        while counter < medianPosition {
            counter += countingList[left]
            left += 1
        }
        var right = left
        left -= 1
        if counter > medianPosition || d % 2 != 0 {
            return Double(left)
        } else {
            while countingList[right] == 0 {
                right += 1
            }
            return Double(left + right) / Double(2)
        }
    }

    let ecount = expenditure.count
    var curr = 0
    while(end < ecount) {
        let median = getMedian()
        if Double(expenditure[end]) >= median * 2 {
            notifications += 1
        }
        countingList[expenditure[curr]] -= 1
        countingList[expenditure[end]] += 1
        curr += 1
        end += 1
    }

    return notifications
}

let input = [1,2,3,4,4]
let input2 = 4

// let input = [2,3,4,2,3,6,8,4,5]
// let input2 = 5

print(activityNotifications(expenditure: input, d: input2))