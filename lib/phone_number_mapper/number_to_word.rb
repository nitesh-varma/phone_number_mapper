module PhoneNumberMapper
  class NumberToWord
    extend Memoist

    MAPPING_LETTERS = {
      2 => ['a','b','c'],
      3 => ['d','e','f'],
      4 => ['g','h','i'],
      5 => ['j','k','l'],
      6 => ['m','n','o'],
      7 => ['p','q','r','s'],
      8 => ['t','u','v'],
      9 => ['w','x','y','z']
    }

    attr_reader :number

    def initialize(number)
      @number = number
    end

    def words
      return incorrect_number_message unless valid_number?
      combinations = {}.tap do |combinations|
        (1..9).each do |n|
          array_1 = number_to_letters[0..n]
          array_2 = number_to_letters[(n + 1)..9]
          unless array_1.empty? || array_2.empty?
            combination_1 = array_1[0].product(*array_1[1..array_1.length]).map(&:join)
            combination_2 = array_2[0].product(*array_2[1..array_2.length]).map(&:join)
            unless combination_1.nil? || combination_2.nil?
              combinations[n] = [(combination_1 & (dictionary[n + 1] || [])), (combination_2 & (dictionary[9 - n] || []))]
            end
          end
        end
      end
      word_combinations(combinations)
    end

    private

    def word_combinations(combinations)
      [].tap do |words|
        combinations.values.each do |values|
          values[0].product(values[1]).each do |value|
            words << value
          end
        end
        words.map!{ |words| [([words.join('')] & dictionary[10]).first, words].compact.first }
      end
    end

    def number_to_letters
      number.digits.reverse.map{ |digit| MAPPING_LETTERS[digit] }
    end
    memoize :number_to_letters

    def dictionary
      Dictionary.new.data
    end
    memoize :dictionary

    def valid_number?
      number.is_a?(Integer) &&
      number.positive? &&
      number.to_s.length == 10 &&
      (number.digits & [0, 1]).empty?
    end

    def incorrect_number_message
      'Provided number is incorrect, please provide 10 digit number without 0 and 1'
    end

  end
end
