class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end
  
  def self.calculate(first_operand, second_operand, operation)
    begin
      if ALLOWED_OPERATIONS.include? operation
        "#{first_operand} #{operation} #{second_operand} = #{first_operand.public_send operation,second_operand}"
      else 
        raise UnsupportedOperation.new
      end
    rescue ZeroDivisionError
      return "Division by zero is not allowed."
    rescue TypeError
      raise ArgumentError.new
    end
  end
end

