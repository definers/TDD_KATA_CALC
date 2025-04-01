require 'rails_helper'

RSpec.describe DelimiterParser do

  describe "#extract_numbers" do
    it "parses numbers with default delimiters" do
      parser = DelimiterParser.new("1,\n2")
      expect(parser.extract_numbers[:result]).to eq(3)
    end

    it "parses numbers with a custom single-character delimiter" do
      parser = DelimiterParser.new("//;\n1;2;3")
      expect(parser.extract_numbers[:result]).to eq(6)
    end

    it "parses numbers with custom delimiters of any length" do
      parser = DelimiterParser.new("//[***]\n1***2***3")
      expect(parser.extract_numbers[:result]).to eq(0)
    end
  end
end
