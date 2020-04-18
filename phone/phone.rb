class Phone
  attr_reader :number

  def initialize(number)
    @number = validate_number(number)
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..10]}"
  end

  private

  def validate_number(number)
    number = clean(number)

    return number             if number.size == 10
    return number[1..10]      if is_long?(number) && is_the_first_one?(number)
    
    invalid_number
    end

  def clean(number)
    number.gsub(/\D/, "")
  end

  def invalid_number
    "0000000000"
  end

  def is_long?(number)
    number.size == 11
  end

  def is_the_first_one?(number)
    number.gsub(/\D/, "")
  end
end
