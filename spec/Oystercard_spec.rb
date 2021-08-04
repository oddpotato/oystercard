require 'OysterCard'

# TO DO - Add context block for no topup
# Add context block for topup

describe OysterCard do

    it 'should show balance of zero' do
      expect(subject.balance).to eq(0)
    end

    it 'should add to the balance' do
      subject.top_up(5)
      expect(subject.balance).to eq(5)
    end
    
    it 'the maximum balance should be 90' do
      expect(OysterCard::MAX_BALANCE).to eq(90)
    end
   
    it 'Raises an error when topup exceeds maximum value' do
       subject.top_up(89) 
       expect { subject.top_up(1) }.to raise_error('Cannot exceed maximum amount £90')
    end
      
    it 'the minimum fare should be $1' do
      expect(OysterCard::MIN_BALANCE).to eq (1)
    end

    context 'it is checking to see if various methods exist' do

    it { is_expected.to respond_to(:in_journey?) }
    
    it { is_expected.to respond_to(:journeys) }

    it { is_expected.to respond_to(:current_journey) }
    
    end

    # it 'Raises an error if you try to tap in with insufficient funds' do 
    #   expect { subject.touch_in }.to raise_error('Insufficient funds')
    # end
  
    context 'storing an entry station and having the correct balance' do
       before(:each) do
         subject.top_up(6)
         subject.touch_in(station)
       end

      let(:station){ double :station }

      it "should charge the user's card on touch-out" do
        expect { subject.touch_out(station) }.to change { subject.balance }.by(-1)
      end  

      it "should show that the user is in a journey" do
        expect(subject.in_journey?).to eq(true)
      end

      it 'shows that the user is not on a journey after they touch out' do
        subject.touch_out(station)
        expect(subject.in_journey?).to eq(false)
      end

      it "stores the entry station when we touch in" do
        expect(subject.entry_station).to eq(station)
      end

      it "stores the entry station in the hash current_journey" do
        expect(subject.current_journey).to include(entry_station: station)
      end

      it 'stores the exit station when we touch out' do
        subject.touch_out(station)
        expect(subject.exit_station).to eq(station)
      end

      it "stores the entry station in the hash current_journey" do
        subject.touch_out(station)
        expect(subject.current_journey).to include(exit_station: station)
      end

      it 'appends a completed journey to the array journey' do
        expect {subject.touch_out(station)}.to change { subject.journeys.length }.by(+1)
      end

    end
end
