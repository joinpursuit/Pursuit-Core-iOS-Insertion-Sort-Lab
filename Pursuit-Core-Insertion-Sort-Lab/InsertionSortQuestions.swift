import Foundation

// Question One
// Implement insertion sort that accepts a closure about how to sort elements
//func insertionSorted<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
//    return arr
//}

func insertionSorted<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    var array = arr
    
    for i in 1..<array.count{
        
        //Used as an index to loop backwards
        var j = i
        
        //looping backwards
        while j > 0 && isSorted(array[j],array[j-1]){
            let temp = array[j-1]
            array[j-1] = array[j]
            array[j] = temp
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
    
    //Typecasting '0' as a generic, will be used for comparison
    let zero: T = 0 as! T
    
    //Getting an array of non-negative elements
    for element in arr{
        if element >= zero{
            positiveArray.append(element)
        }
    }
    
    //Sorting the array of non-negative elements
    for i in 1..<positiveArray.count{
        var index = i
        
        //looping backwards
        while index > 0 && isSorted(positiveArray[index], positiveArray[index - 1]){
            let temp = positiveArray[index-1]
            positiveArray[index-1] = positiveArray[index]
            positiveArray[index] = temp
            index -= 1
        }
    }
    
    var answer = [T]()
    var positiveIndex = 0
    
    //Iterating the original array, append negative value if found, otherwise append element from positive array
    for e in arr{
        if e < zero{
            answer.append(e)
        }else{
            //Append element from positive array
            answer.append(positiveArray[positiveIndex])
            
            //increment the positive index
            positiveIndex += 1
        }
    }
    return answer
}

// Question Three
// Implement insertion sort in place
func insertionSort<T: Comparable>(arr: inout [T], by isSorted: (T, T) -> Bool) -> [T] {
    for i in 1..<arr.count{
        
        //Used as an index to loop backwards
        var j = i
        
        //looping backwards
        while j > 0 && isSorted(arr[j],arr[j-1]){
            let temp = arr[j-1]
            arr[j-1] = arr[j]
            arr[j] = temp
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
        print("current value is \(current!.value)")
        
        print("Succesfully added new node!")
        
        var last = newList.last
    
        while last?.previous != nil {

            print("There is a previous node!")

            if let lastValue = last?.value, let previousValue = last?.previous?.value{

                print("Unwrapping success!")
                if isSorted(lastValue,previousValue){
                    //swap
                    print("swapping")
                    let temp = lastValue
                    last?.value = previousValue
                    last?.previous?.value = temp
                }
            }
            last = last?.previous
        }
        print("end of loop")
        current = current?.next
    }
    return newList
}




