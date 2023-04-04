pub const Planet = enum {
    mercury,
    venus,
    earth,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    fn getOrbitalPeriod(self: Planet) f64 {
        return switch (self) {
            .mercury => 0.2408467,
            .venus => 0.61519726,
            .earth => 1.0,
            .mars => 1.8808158,
            .jupiter => 11.862615,
            .saturn => 29.447498,
            .uranus => 84.016846,
            .neptune => 164.79132,
        };
    }

    pub fn age(self: Planet, seconds: usize) f64 {
        const planetYear = 31557600.0 * getOrbitalPeriod(self);
        return @intToFloat(f64, seconds) / planetYear;
    }
};
