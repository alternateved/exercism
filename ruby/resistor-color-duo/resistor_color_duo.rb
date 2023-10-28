class ResistorColorDuo
  COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]

  def self.value(bands)
    bands
      .take(2)
      .map { |band| COLORS.index(band)}
      .join
      .to_i
  end
end

