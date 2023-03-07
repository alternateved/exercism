pub fn squareOfSum(number: usize) usize {
    var sum: usize = 0;
    var i: usize = 1;
    while (i <= number) : (i += 1) {
        sum += i;
    }
    return sum * sum;
}

pub fn sumOfSquares(number: usize) usize {
    var squares: usize = 0;
    var i: usize = 1;
    while (i <= number) : (i += 1) {
        squares += i * i;
    }
    return squares;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
