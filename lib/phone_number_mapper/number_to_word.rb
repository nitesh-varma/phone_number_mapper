module PhoneNumberMapper
  class NumberToWord

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
    end

    private

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
