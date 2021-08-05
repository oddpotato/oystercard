require 'Journey'

describe Journey do
      before do
      @trip = Journey.new('Kings Cross')
    end

    it 'accepts an entry station when created' do
      expect(@trip.entry_station).to eq('Kings Cross')
    end
end