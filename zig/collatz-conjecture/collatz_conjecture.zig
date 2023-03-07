pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) anyerror!usize {
    if (number < 1) return error.IllegalArgument;
    var step: usize = 0;
    var conj: usize = number;
    while (conj > 1) : (step += 1) {
        conj = if (conj % 2 == 0)
            conj / 2
        else
            conj * 3 + 1;
    }
    return step;
}
