require_relative '../../app/services/calculator_service'

RSpec.describe CalculatorService do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(CalculatorService.add("")).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(CalculatorService.add("1")).to eq(1)
    end

    it 'returns sum of two comma-separated numbers' do
      expect(CalculatorService.add("1,2")).to eq(3)
    end
    it 'returns sum for multiple comma-separated numbers' do
      expect(CalculatorService.add("1,2,3,4")).to eq(10)
    end
     it 'handles newlines between numbers along with commas' do
      expect(CalculatorService.add("1\n2,3")).to eq(6)
    end

    it 'supports custom single-character delimiter' do
      expect(CalculatorService.add("//;\n1;2")).to eq(3)
    end

    it 'supports custom delimiter even with multiple numbers' do
      expect(CalculatorService.add("//|\n1|2|3")).to eq(6)
    end

    it 'returns 0 when custom delimiter has no numbers' do
      expect(CalculatorService.add("//;\n")).to eq(0)
    end

    it 'raises an error when there is a single negative number' do
      expect {
        CalculatorService.add("1,-2,3")
      }.to raise_error("negative numbers not allowed -2")
    end

    it 'raises an error when multiple negative numbers are present' do
      expect {
        CalculatorService.add("-1,2,-3,4")
      }.to raise_error("negative numbers not allowed -1,-3")
    end

    it 'raises error for negatives with custom delimiters' do
      expect {
        CalculatorService.add("//;\n1;-2;3;-4")
      }.to raise_error("negative numbers not allowed -2,-4")
    end
  end
end
