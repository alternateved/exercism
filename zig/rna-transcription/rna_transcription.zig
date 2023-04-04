const mem = @import("std").mem;

pub const RnaError = error{Invalid};

fn transcribeNucleotide(nucleotide: u8) RnaError!u8 {
    return switch (nucleotide) {
        'G' => 'C',
        'C' => 'G',
        'T' => 'A',
        'A' => 'U',
        else => return RnaError.Invalid,
    };
}

pub fn toRna(allocator: mem.Allocator, dna: []const u8) (RnaError || mem.Allocator.Error)![]const u8 {
    var rna = try allocator.alloc(u8, dna.len);
    for (dna) |n, i| rna[i] = try transcribeNucleotide(n);
    return rna;
}
