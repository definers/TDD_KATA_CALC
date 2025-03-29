class StringCalculatorsController < ApplicationController

  def sum_numbers
    numbers = params[:numbers_str]

    return 0 if numbers.blank?
    delimiter, numbers = extract_delimiters(numbers)
    num_list = parse_numbers(numbers, delimiter)
    validate_num = validate_numbers!(num_list)
    @result = sum_numbers(num_list) if validate_num
    render json: { result: @result }, status: :ok
  end

  private

    def self.extract_delimiters(numbers)
      return [",|\n", numbers] unless numbers.start_with?("//")

      delimiter_part, numbers = numbers.split("\n", 2)
      delimiters = delimiter_part.scan(/\[(.*?)\]/).flatten.presence || [delimiter_part[2]]
      [Regexp.union(delimiters.map { |d| Regexp.escape(d) }), numbers]
    end

    def parse_numbers(numbers, delimiter)
      numbers.split(/#{delimiter}/).map(&:to_i)
    end

    # No Negatives are allowed
    def validate_numbers!(num_list)
      negatives = num_list.select(&:negative?)
      raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?
    end

    #sum only numbers less than 1000
    def sum_numbers(num_list)
      num_list.reject { |n| n > 1000 }.sum #reject if any number greater than 1000 as per requirement
    end
end
