require 'Station'

describe Station do
    before do
      @station = Station.new('Kings Cross', 2)
    end

    it 'has a name when generated' do
      expect(@station.name).to eq('Kings Cross')
    end

    it 'has a zone when generated' do
      expect(@station.zone).to eq(2)
    end
end