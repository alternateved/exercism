pub fn squareOfSum(number: usize) usize {
    var sum: usize = 0;
    var i: usize = 0;
    while (i <= number) {
        sum += i;
        i += 1;
    }
    return sum * sum;
}

pub fn sumOfSquares(number: usize) usize {
    var squares: usize = 0;
    var i: usize = 0;
    while (i <= number) {
        squares += i * i;
        i += 1;
    }
    return squares;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
