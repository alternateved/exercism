const ascii = @import("std").ascii;

pub fn isIsogram(str: []const u8) bool {
    for (str) |c1, i|
        if (ascii.isAlphabetic(c1))
            for (str[i + 1 ..]) |c2|
                if (ascii.toLower(c1) == ascii.toLower(c2))
                    return false;

    return true;
}
