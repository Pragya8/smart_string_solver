class StringEvaluation
  def self.add(numbers)
    return 0 if numbers.empty?  # Return 0 for an empty input string

    delimiter = ",|\\n" # Default delimiters: comma and newline

    # Check if custom delimiter is specified
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter_section = parts[0][2..-1]
      numbers = parts[1]

      delimiters = delimiter_section.scan(/\[(.*?)\]/).flatten
      delimiter = delimiters.any? ? delimiters.map { |d| Regexp.escape(d) }.join("|") : Regexp.escape(delimiter_section)
    end

    # string into an array of numbers conversion, here ignoring numbers > 1000
    num_array = numbers.split(/#{delimiter}/).map(&:to_i).reject { |num| num > 1000 }
    negatives = num_array.select { |num| num < 0 }

    # Raising exception for negative numbers
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    # it will return sum of numbers from the string
    num_array.sum
  end
end
