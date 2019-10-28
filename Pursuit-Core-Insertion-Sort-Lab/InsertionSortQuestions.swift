import Foundation

// Question One
// Implement insertion sort that accepts a closure about how to sort elements
func insertionSorted<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    var array = arr
    
    for i in 1..<array.count {
        var j = i
        
        while j > 0 && isSorted(array[j], array[j - 1]){
            let tempArr = array[j - 1]
            array[j - 1] = array[j]
            array[j] = tempArr
            j -= 1
        }
    }
    return array
}

// Question Two
// Sort an array of Ints using insertion sort without changing the position of any negative numbers
// https://www.geeksforgeeks.org/sort-an-array-without-changing-position-of-negative-numbers/
func insertionSortWithoutMovingNegatives<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    var positiveArray = [T]()
    
    let zero: T = 0 as! T
    
    for element in arr {
        if element >= zero {
            positiveArray.append(element)
        }
    }
    
    for i in 1..<positiveArray.count {
        var index = i
        
        while index > 0 && isSorted(positiveArray[index], positiveArray[index - 1]) {
            let tempArr = positiveArray[index - 1]
            positiveArray[index - 1] = positiveArray[index]
            positiveArray[index] = tempArr
            index -= 1
        }
    }
    
    var answer = [T]()
    var positiveIndex = 0
    
    for i in arr {
        if i < zero {
            answer.append(i)
        } else {
            answer.append(positiveArray[positiveIndex])
            positiveIndex += 1
        }
    }
    return answer
}

// Question Three
// Implement insertion sort in place
func insertionSort<T: Comparable>(arr: inout [T], by isSorted: (T, T) -> Bool) -> [T] {
    for i in 1..<arr.count {
        
        var j = i
        
        while j > 0 && isSorted(arr[j],arr[j - 1]){
            let tempArr = arr[j - 1]
            arr[j - 1] = arr[j]
            arr[j] = tempArr
            j -= 1
        }
    }
    
    return arr
}

// Question Four
// Implement insertion sort on a linked list
func insertionSorted<T: Comparable>(list: LinkedList<T>, by isSorted: (T, T) -> Bool) -> LinkedList<T> {
    let inputList = list
    let head = inputList.head
    
    guard let _ = head, let _ = head!.next else {
        return inputList
    }
    
    let newList = LinkedList<T>()
    
    var current = head
    
    while current != nil {
        
        newList.append(current!.value)
        var last = newList.last
        
        while last?.previous != nil {
            
            if let lastValue = last?.value, let previousValue = last?.previous?.value {
                
                if isSorted(lastValue,previousValue) {
                    let temp = lastValue
                    last?.value = previousValue
                    last?.previous?.value = temp
                }
            }
            last = last?.previous
        }
        
        current = current?.next
    }
    return newList
}

