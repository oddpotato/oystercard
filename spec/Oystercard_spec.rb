require 'OysterCard'

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
        
    it 'shows that the user is on a journey after they touch in' do
      subject.balance = 6
      expect { subject.touch_in }.to change { subject.in_journey? }.from(false).to(true)
    end
    
    it 'shows that the user is not on a journey after they touch out' do
      subject.balance = 6
      subject.touch_in
      expect { subject.touch_out }.to change { subject.in_journey? }.from(true).to(false)
    end

    it { is_expected.to respond_to(:in_journey?) }
    
    it 'Raises an error if you try to tap in with insufficient funds' do 
      expect { subject.touch_in }.to raise_error('Insufficient funds')
    end

    it 'the minimum fare should be $1' do
      expect(OysterCard::MIN_BALANCE).to eq (1)
    end

    it "should charge the user's card on touch-out" do
      subject.balance = 6
      expect { subject.touch_out }.to change { subject.balance }.by(-1)
    end
end

