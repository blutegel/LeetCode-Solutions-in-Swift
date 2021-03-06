/*

https://oj.leetcode.com/problems/string-to-integer-atoi/

#8 String to Integer (atoi)

Level: easy

Implement atoi to convert a string to an integer.

Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.

Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.

Update (2015-02-10):
The signature of the C++ function had been updated. If you still see your function signature accepts a const char * argument, please click the reload button  to reset your code definition.

Requirements for atoi:
The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.

The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.

If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.

If no valid conversion could be performed, a zero value is returned. If the correct value is out of the range of representable values, INT_MAX (2147483647) or INT_MIN (-2147483648) is returned.

Inspired by @yuruofeifei at https://oj.leetcode.com/discuss/8886/my-simple-solution

*/

// Helper
private extension String {
    subscript (index: Int) -> Character {
        return self[advance(self.startIndex, index)]
    }
}

class Easy_008_String_to_Integer_atoi {
    // O (N)
    class func atoi(str: String) -> Int {
        var sign: Bool = true, len: Int = str.characters.count, base: Int = 0
        for j in 0..<len {
            let zeroString: String = String("0")
            let zeroValue: Int = Int(zeroString.utf8[zeroString.utf8.startIndex])
            if base == 0 && str[j] == " " || str[j] == "+" {
                continue
            } else if base == 0 && str[j] == "-" {
                sign = false
                continue
            } else {
                let integerValue: Int = Int(str.utf8[advance(str.utf8.startIndex, j)]) - zeroValue
                if integerValue >= 0 && integerValue <= 9 {
                    if base > Int.max/10 || (base == Int.max/10 && integerValue > 7) {
                        if sign {
                            return Int.max
                        } else {
                            return Int.min
                        }
                    }
                    base = integerValue + 10 * base
                }
            }
        }
        if sign {
            return base
        } else {
            return 0 - base
        }
    }
}