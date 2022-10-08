
var unsortedArray: [String] = []

var a: Int

func swap(words: inout[String], firstIndex: Int, secondIndex:Int) {
    let temp = words[firstIndex]
    words[firstIndex] = words[secondIndex]
    words[secondIndex] = temp
}

func wordOneGreater(word1: String, word2: String) -> Bool {
    let shorterWordLength = min(word1.count, word2.count)
    for k in 0..<shorterWordLength {
        let char2 = word2[word2.index(word2.startIndex, offsetBy: k)]
        let char1 = word1[word1.index(word1.startIndex, offsetBy: k)]
        if char2 > char1{
            return false
        } else if char2 < char1 {
            return true
        } else if k == (shorterWordLength - 1) {
            if word1.count > word2.count {
                return true
            }
        }   
    }
    return false
}


func insertionSort() {
    for i in 1..<unsortedArray.count {
        var location = i
        while wordOneGreater(word1: unsortedArray[location-1], word2: unsortedArray[location]) {

            swap(words:&unsortedArray, firstIndex:location - 1, secondIndex:location)
            
            location -= 1

            if location < 1 {
                break
            }
        }
    }
}
    
while let input = readLine() {
    unsortedArray.append(input.lowercased())
}


insertionSort()


a = 0

while a < unsortedArray.count {
    print("\(a + 1). \(unsortedArray[a])")
    a += 1
}
