/*Mark and Toys*/
//bubble sort time O(n^2) space O(p)
func maximumToys(prices: [Int], k: Int) -> Int {
    var prices = prices
    for _ in 0..<prices.count {
        for i in 0..<prices.count-1 {
            if(prices[i] > prices[i+1]){
                (prices[i],prices[i+1]) = (prices[i+1],prices[i])
            }
        }
    }
    var k = k
    var i = 0
    var res = 0
    let pcount = prices.count
    while(k - prices[i] >= 0 && i < pcount) {
        k -= prices[i]
        res += 1
        i+=1
    }
    return res
}

//merge sort time O(n log n) space O(n)
func maximumToys(prices: [Int], k: Int) -> Int {
    var prices = mergeSort(prices)
    
    var k = k
    var res = 0
    var i = 0
    var pcount = prices.count
    while(k - prices[i] >= 0 && i<pcount) {
        k-=prices[i]
        i+=1
        res += 1
    }
    return res
}

func mergeSort(_ arr:[Int]) -> [Int] {
    if arr.count <= 1 {return arr}
    let mid = arr.count / 2
    let leftArr = mergeSort(Array(arr[0..<mid]))
    let rightArr = mergeSort(Array(arr[mid..<arr.count]))
    return merge(leftArr,rightArr)
}

func merge(_ arr1:[Int], _ arr2:[Int])-> [Int] {
    var res = [Int]()
    var leftI = 0, rightI = 0
    var leftCount = arr1.count
    var rightCount = arr2.count
    while(leftI < leftCount && rightI < rightCount) {
        if (arr1[leftI] < arr2[rightI]) {
            res.append(arr1[leftI])
            leftI += 1
        } else if (arr1[leftI] > arr2[rightI]) {
            res.append(arr2[rightI])
            rightI += 1
        } else {
            res.append(arr1[leftI])
            res.append(arr2[rightI])
            leftI += 1
            rightI += 1
        }
    }
    while(leftI < leftCount) {
        res.append(arr1[leftI])
        leftI += 1
    }
    while(rightI < rightCount) {
        res.append(arr2[rightI])
        rightI += 1
    }
    
    return res
}

//heap sort
