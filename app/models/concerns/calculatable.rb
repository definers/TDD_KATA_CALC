module Calculatable
  extend ActiveSupport::Concern

  class_methods do
    def add(numbers)
      return 0 if numbers.blank?

      parser =  DelimiterParser.new(numbers)
      parsed_numbers_sum = parser.extract_numbers

      return parsed_numbers_sum
    end
  end
end
