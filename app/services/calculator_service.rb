class CalculatorService
  def self.add(numbers)
    new(numbers).add
  end

  def initialize(numbers)
    @numbers = numbers
  end

  def add
    return 0 if @numbers.empty?

    delimiter = /,|\n/
    input = @numbers

    if @numbers.start_with?("//")
      parts = @numbers.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2])
      input = parts[1]
    end

    nums = input.split(/#{delimiter}/).map(&:to_i)

    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    nums.sum
  end
end
