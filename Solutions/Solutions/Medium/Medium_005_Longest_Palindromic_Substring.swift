/*

https://oj.leetcode.com/problems/longest-palindromic-substring/

#5 Longest Palindromic Substring

Level: medium

Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, and there exists one unique longest palindromic substring.

Inspired by @hanleyChu at https://oj.leetcode.com/discuss/9948/a-very-brief-o-n-time-o-1-space-solution-ac

*/

// Helper
private extension String {
    subscript (i: Int) -> Character {
        let index: Index = advance(self.startIndex, i)
        return self[index]
    }
    subscript (intRange: Range<Int>) -> String {
        return self[advance(self.startIndex, intRange.startIndex) ..< advance(self.startIndex, intRange.endIndex)]
    }
}

class Medium_005_Longest_Palindromic_Substring {
    // Helper
    class func isPalindrome(inout s: String, startPosition: Int, endPosition: Int) -> Bool {
        let len = endPosition - startPosition + 1
        for i in 0..<len/2 {
            if s[i + startPosition] != s[len - 1 - i + startPosition] {
                return false
            }
        }
        return true
    }

    // O (N ^ 2)
    class func longest(var s: String) -> String {
        var longestLength = 0, longestIndex = 0, n = s.characters.count
        _ = 0
        for currentIndex in 0..<n {
            if isPalindrome(&s, startPosition: currentIndex - longestLength, endPosition: currentIndex) {
                longestLength += 1
                longestIndex = currentIndex
            } else if currentIndex - longestLength - 1 >= 0 && isPalindrome(&s, startPosition: currentIndex - longestLength - 1, endPosition: currentIndex) {
                longestLength += 2
                longestIndex = currentIndex
            }
        }
        return s[longestIndex - longestLength + 1 ..< longestIndex + 1]
    }
}