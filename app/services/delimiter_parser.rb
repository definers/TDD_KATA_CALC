# DelimiterParser :
# It will extract the numbers
# and negatives and report them all
# extract the delimiter
# and finally will sum the integers < 1000
class DelimiterParser
  DEFAULT_DELIMITERS = /,|\n/

  def initialize(numbers)
    @numbers = numbers
    @negatives = false
    @delimiter = ","
    @num_list = []
  end

  def extract_numbers
    if @numbers.match(%r{//(.)\n(.*)})
      @delimiter = Regexp.escape($1) # $1 and $2 extract the delimiter and number string respectively.
      @numbers = $2
    end

    @num_list = @numbers.split(@delimiter).map(&:to_i)
    @negatives = @num_list.select { |num| num.negative? }

    return { negatives: @negatives.join(',') } unless @negatives.empty?

    return { negatives: false, result: @num_list.reject { |num| num > 1000 }.sum }

  end
end
