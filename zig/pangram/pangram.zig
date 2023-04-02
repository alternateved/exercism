const ascii = @import("std").ascii;
const alphabet = "abcdefghijklmnopqrstuvwxyz";

pub fn isPangram(str: []const u8) bool {
    var marks = [_]bool{false} ** 26;

    for (str) |strChar| {
        for (alphabet) |alphabetChar, i| {
            if (ascii.toLower(strChar) == alphabetChar) {
                marks[i] = true;
                break;
            }
        }
    }

    for (marks) |mark| if (mark == false) return false;
    return true;
}
