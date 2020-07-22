require './time_converter.rb'
require './add_minutes.rb'

RSpec.describe 'time_converter' do
  let(:time_converter) { TimeConverter.new('12:10 AM') }
  context 'time_converter class' do
    it 'creates a instance of time_converter' do
      expect(time_converter).to be_instance_of(TimeConverter)
    end

    it 'shows the time' do
      expect(time_converter.show_time).to eq('12:10 AM')
    end

    it 'has minutes' do
      expect(time_converter.minutes).to eq(730)
    end

    it 'adds minutes' do
      time_converter.add_minutes(10)
      expect(time_converter.minutes).to eq(740)
    end

    it 'adds minutes and shows new time' do
      time_converter.add_minutes(10)
      expect(time_converter.time_string).to eq('12:20 AM')
    end

    it 'adds minutes more then a day and shows time' do
      time_converter.add_minutes(1440)
      expect(time_converter.time_string).to eq('12:10 AM')
    end
  end
end

RSpec.describe 'add_minutes' do
  context 'adding minutes' do
    it 'returns the new time adding 45 minutes' do
      expect(add_minutes('9:15 AM', 45)).to eq('10:00 AM')
    end

    it 'no change from AM to PM' do
      expect(add_minutes('12:59 AM', 1)).to eq('1:00 AM')
    end

    it 'no change from PM to AM' do
      expect(add_minutes('12:59 PM', 1)).to eq('1:00 PM')
    end

    it 'change from PM to AM' do
      expect(add_minutes('11:59 PM', 1)).to eq('12:00 AM')
    end

    it 'change from AM to PM' do
      expect(add_minutes('11:59 AM', 1)).to eq('12:00 PM')
    end

    it 'change from PM to AM with more then one day' do
      expect(add_minutes('12:59 PM', 1441)).to eq('1:00 PM')
    end

    it 'adds 200 minutes' do
      expect(add_minutes('9:13 AM', 200)).to eq('12:33 PM')
    end

    it 'adds 1 day and 1 minutes' do
      expect(add_minutes('11:59 AM', 1441)).to eq('12:00 PM')
    end

    it 'changes 00 to 12' do
      expect(add_minutes('11:59 PM', 1441)).to eq('12:00 AM')
    end

    it 'add 1 day - 1 minutes' do
      expect(add_minutes('12:00 PM', 1439)).to eq('11:59 AM')
    end

    it 'big number' do
      expect(add_minutes('12:00 PM', 2880000)).to eq('12:00 PM')
    end
  end
end
