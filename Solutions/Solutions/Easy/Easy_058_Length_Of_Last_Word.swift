/*

https://leetcode.com/problems/length-of-last-word/

#58 Length of Last Word

Level: easy

Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.

If the last word does not exist, return 0.

Note: A word is defined as a character sequence consists of non-space characters only.

For example,
Given s = "Hello World",
return 5.

Inspired by @eaglesky1990 at https://leetcode.com/discuss/9148/my-simple-solution-in-c

*/

import Foundation

private extension String {
    subscript (i: Int) -> Character {
        return self[advance(self.startIndex, i)]
    }
}

struct Easy_058_Length_Of_Last_Word {
    static func lengthOfLastWord(s: String) -> Int {
        var len = 0
        var i = 0
        while i < s.characters.count {
            if s[i++] != " " {
                len++
            } else if i < s.characters.count && s[i] != " "  {
                len = 0
            }
        }
        return len
    }
}
