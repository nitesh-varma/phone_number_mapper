module PhoneNumberMapper
  class Dictionary
    extend Memoist

    FILE_PATH = File.join(File.dirname(__FILE__), '../../files/dictionary.txt')

    def data
      {}.tap do |dictionary|
        File.open(FILE_PATH).each_line do |line|
          if line.length >= 3
            dictionary[line.length] = [] if dictionary[line.length].nil? || dictionary[line.length].empty?
            dictionary[line.length].push(line.chomp.downcase)
          end
        end
      end
    end
    memoize :data

  end
end
