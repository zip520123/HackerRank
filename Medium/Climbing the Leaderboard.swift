/*Climbing the Leaderboard
An arcade game player wants to climb to the top of the leaderboard and track their ranking. The game uses Dense Ranking, so its leaderboard works like this:

The player with the highest score is ranked number  on the leaderboard.
Players who have equal scores receive the same ranking number, and the next player(s) receive the immediately following ranking number.
Example



The ranked players will have ranks , , , and , respectively. If the player's scores are ,  and , their rankings after each game are ,  and . Return .

Function Description

Complete the climbingLeaderboard function in the editor below.

climbingLeaderboard has the following parameter(s):

int ranked[n]: the leaderboard scores
int player[m]: the player's scores
Returns

int[m]: the player's rank after each new score
Input Format

The first line contains an integer , the number of players on the leaderboard.
The next line contains  space-separated integers , the leaderboard scores in decreasing order.
The next line contains an integer, , the number games the player plays.
The last line contains  space-separated integers , the game scores.

Constraints

 for 
 for 
The existing leaderboard, , is in descending order.
The player's scores, , are in ascending order.
Subtask

For  of the maximum score:

Sample Input 1

CopyDownload
Array: ranked
100
100
50
40
40
20
10

 



Array: player
5
25
50
120

 
7
100 100 50 40 40 20 10
4
5 25 50 120
Sample Output 1

6
4
2
1
Explanation 1

Alice starts playing with  players already on the leaderboard, which looks like this:

image

After Alice finishes game , her score is  and her ranking is :

image

After Alice finishes game , her score is  and her ranking is :

image

After Alice finishes game , her score is  and her ranking is tied with Caroline at :

image

After Alice finishes game , her score is  and her ranking is :

image


Sample Input 2

CopyDownload
Array: ranked
100
90
90
80
75
60

 



Array: player
50
65
77
90
102

 
6
100 90 90 80 75 60
5
50 65 77 90 102
Sample Output 2

6
5
4
2
1
*/
// time O(n^2) space O(n)
// func climbingLeaderboard(ranked: [Int], player: [Int]) -> [Int] {
//     var res = [Int]()
//     var map = [Int: Int]()
//     var currRank = 1
//     if (ranked.count == 0) {
//         for _ in player {
//             res.append(1)
//             return res
//         }
//     }

//     for item in ranked {
//         if (map[item] != nil) {
            
//         } else {
//             map[item] = currRank
//             currRank += 1
            
//         }
//     }

//     out:for curr in player {
//         var rank = 1
//         for rankScore in ranked {
//             let value = map[rankScore]!
//             if curr >= rankScore {
//                 res.append(value)
//                 continue out 
//             }
//             rank = value
//         }
//         res.append(rank + 1)
//     }

//     return res
// }
//binary search time O(n log n) space O(n)
func climbingLeaderboard(ranked: [Int], player: [Int]) -> [Int] {
    var res = [Int]()
    var map = [Int: Int]()
    var currRank = 1
    if (ranked.count == 0) {
        for _ in player {
            res.append(1)
            return res
        }
    }

    for item in ranked {
        if (map[item] != nil) {
        } else {
            map[item] = currRank
            currRank += 1
        }
    }
    out: for target in player {
        var left = 0, right = ranked.count - 1

        while (left <= right) {
            let mid = left + (right - left) >> 1
            if ranked[mid] > target {
                left = mid + 1
            } else if ranked[mid] < target {
                right = mid - 1
            } else {
                let rank = map[ranked[mid]]!
                res.append(rank)
                continue out
            }
        }
    
        if left >= ranked.count {
            let rank = map[ranked[ranked.count - 1]]!
            res.append(rank + 1)
        } else if left == 0 {
            res.append(1)
        } else {
            let rank = map[ranked[left]]!
            res.append(rank)
        }
    }
    return res
}
let input1 = [100,90,90,80,75,60]
let input2 = [50,65,77,90,102]
print(climbingLeaderboard(ranked: input1, player: input2))