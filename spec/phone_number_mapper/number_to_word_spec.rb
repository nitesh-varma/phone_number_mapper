RSpec.describe PhoneNumberMapper::NumberToWord do

  describe 'Validations' do
    describe '#number' do
      it 'Should not accept 123' do
        expect(
          PhoneNumberMapper::NumberToWord.new(123).words
        ).to eq 'Provided number is incorrect, please provide 10 digit number without 0 and 1'
      end
      it 'Should not accept nil' do
        expect(
          PhoneNumberMapper::NumberToWord.new(nil).words
        ).to eq 'Provided number is incorrect, please provide 10 digit number without 0 and 1'
      end
      it 'Should not accept string' do
        expect(
          PhoneNumberMapper::NumberToWord.new('7854785478').words
        ).to eq 'Provided number is incorrect, please provide 10 digit number without 0 and 1'
      end
      it 'Should accept 6686787825' do
        expect(
          PhoneNumberMapper::NumberToWord.new(6686787825).words
        ).to be_kind_of(Array)
      end
    end
  end

  describe 'Instance Methods' do
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

      it 'Should execute within 1000 ms' do
        expect {
          PhoneNumberMapper::NumberToWord.new(6686787825).words
        }.to perform_under(1000).ms
        expect {
          PhoneNumberMapper::NumberToWord.new(2282668687).words
        }.to perform_under(1000).ms
      end
    end
  end

end
