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
  end
end
