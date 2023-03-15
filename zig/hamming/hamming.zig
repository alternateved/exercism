pub const DnaError = error{ UnequalDnaStrands, EmptyDnaStrands };

pub fn compute(first: []const u8, second: []const u8) DnaError!usize {
    if (first.len == 0 or second.len == 0) return error.EmptyDnaStrands;
    if (first.len != second.len) return error.UnequalDnaStrands;
    var distance: usize = 0;
    for (first) |c, i| {
        if (c != second[i]) distance += 1;
    }
    return distance;
}
