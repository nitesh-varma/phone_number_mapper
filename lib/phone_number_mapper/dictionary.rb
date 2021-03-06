module PhoneNumberMapper
  class Dictionary

    FILE_PATH = File.join(File.dirname(__FILE__), '../../files/dictionary.txt')

    # Create a hash with key as length of string and associated words in it's value as array
    def data
      {}.tap do |dictionary|
        File.open(FILE_PATH).each_line do |line|
          line = line.chomp
          if line.length >= 3
            dictionary[line.length] = [] if dictionary[line.length].nil? || dictionary[line.length].empty?
            dictionary[line.length].push(line.downcase)
          end
        end
      end
    end

  end
end
