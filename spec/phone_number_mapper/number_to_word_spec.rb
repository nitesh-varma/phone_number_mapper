RSpec.describe PhoneNumberMapper::NumberToWord do

  describe 'Validate Number' do
    it 'should not accept 123' do
      expect(
        PhoneNumberMapper::NumberToWord.new(123).words
      ).to eq 'Provided number is incorrect, please provide 10 digit number without 0 and 1'
    end
    it 'should not accept nil' do
      expect(
        PhoneNumberMapper::NumberToWord.new(nil).words
      ).to eq 'Provided number is incorrect, please provide 10 digit number without 0 and 1'
    end
    it 'should not accept string' do
      expect(
        PhoneNumberMapper::NumberToWord.new('7854785478').words
      ).to eq 'Provided number is incorrect, please provide 10 digit number without 0 and 1'
    end
    it 'should accept 6686787825' do
      expect(
        PhoneNumberMapper::NumberToWord.new(6686787825).words
      ).to be_kind_of(Array)
    end
  end

  describe '#words' do

    it 'Validate result for 6686787825' do
      expect(
        PhoneNumberMapper::NumberToWord.new(6686787825).words
      ).to match_array([['motor', 'usual'], ['noun', 'struck'], ['nouns', 'truck'], ['nouns', 'usual'], ['onto', 'struck'], 'motortruck'])
    end

    it 'Validate result for 2282668687' do
      expect(
        PhoneNumberMapper::NumberToWord.new(2282668687).words
      ).to match_array([['act', 'amounts'], ['act', 'contour'], ['acta', 'mounts'], ['bat', 'amounts'], ['bat', 'contour'], ['cat', 'contour'], 'catamounts'])
    end

  end

end
