class Matrix
  def initialize(str)
    @matrix = str.split(/\n/).map { |row| row.split.map(&:to_i) }
  end

  def row(n)
    @matrix[n - 1]
  end

  def column(n)
    @matrix.map { |row| row[n - 1] }
  end
end
