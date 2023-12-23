module ETL
  def self.transform(data)
    data.each_with_object({}) do |(key, values), new_data|
      values.each do |letter|
        new_data[letter.downcase] = key
      end
    end
  end
end
