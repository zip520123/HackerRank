/*Sorting: Bubble Sort*/
func countSwaps(a: [Int]) -> Void {
    var a = a
    var swapCount = 0
    for _ in 0..<a.count {
        for j in 0..<a.count-1 {
            if (a[j]>a[j+1]){
                (a[j],a[j+1]) = (a[j+1],a[j])
                swapCount += 1
            }
        }
    }
    print("Array is sorted in \(swapCount) swaps.")
    print("First Element: \(a[0])")
    print("Last Element: \(a[a.count-1])")
}
let input = [6,4,1]
countSwaps(a:input)