module PhoneNumber
  def self.clean(input)
    input.gsub(/[\D]+/, "").sub(/^1/, "")[/^([2-9]\d\d){2}\d{4}$/]
  end
end
