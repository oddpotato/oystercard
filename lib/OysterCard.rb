class OysterCard
    
    attr_reader :balance

    def initialize(balance = 0)
      @balance = balance
    end
   
    def top_up(credit)
      @balance = balance + credit
    end
end