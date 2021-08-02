require 'OysterCard'

describe OysterCard do

    it 'should show balance of zero' do
      expect(subject.balance).to eq(0)
    end

    it 'should add to the balance' do
      subject.top_up(5)
      expect(subject.balance).to eq(5)
    end

end

# make sure it can be topped up
# checked if top up method invoked value argument
# balance card increase by that amount
# 
# i want to add money to my card

# top_up