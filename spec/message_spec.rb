# rubocop:disable Layout/LineLength

require_relative '../lib/message.rb'

describe Message do
  let(:message) { Message.new }

  describe '#welcome' do
    it 'returns a string with the welcome message.' do
      expect(message.welcome).to eql("\t\t\t-----WELCOME-----\n\nHere you can find the details of coronavirus COVID-19 cases of a country, territory, or conveyance.\n\nSearch by entering a COUNTRY NAME or POSITION or see the list for WHOLE WORLD.\n\n")
    end
  end

  describe '#enter_choice' do
    it 'returns a string asking user to make a choice' do
      expect(message.enter_choice).to eql("Please enter\n\t1 for search by COUNTRY NAME.\n\t2 for search by POSITION.\n\t3 for list of WHOLE WORLD.")
    end
  end

  describe '#enter_country_name' do
    it 'returns a string asking user to enter a country name' do
      expect(message.enter_country_name).to eql('Please enter the country name you want to search: ')
    end
  end

  describe '#enter_position' do
    it 'returns a string asking user to enter a number' do
      expect(message.enter_position).to eql('Please enter the position you want to find a country about [1-215]: ')
    end
  end

  describe '#valid_position' do
    it 'returns a string asking user to restrict input between 1 and 215 only.' do
      expect(message.valid_position).to eql('Please enter between 1 and 215 only.')
    end
  end

  describe '#all_country' do
    it 'returns a string message' do
      expect(message.all_country).to eql('Showing the details about COVID-19 infections for all countries and territories in world:')
    end
  end

  describe '#continue' do
    it 'returns a string asking user to continue or stop.' do
      expect(message.continue).to eql('Do you want to continue? (Y/N): ')
    end
  end

  describe '#thank' do
    it 'returns a string with thankyou message.' do
      expect(message.thank).to eql("\n\n\t\t\t...THANK YOU...")
    end
  end
end
# rubocop:enable Layout/LineLength
