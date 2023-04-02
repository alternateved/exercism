const math = @import("std").math;

fn countDigits(num: u128) u8 {
    var tmp: u128 = num;
    var digits: u8 = 0;

    while (tmp > 0) {
        digits += 1;
        tmp = tmp / 10;
    }

    return digits;
}

pub fn isArmstrongNumber(num: u128) bool {
    var tmp: u128 = num;
    var digits: u8 = countDigits(num);
    var result: u128 = 0;

    while (tmp > 0) {
        const x: u128 = tmp % 10;
        result += math.pow(u128, x, digits);
        tmp = tmp / 10;
    }

    return num == result;
}
