class OysterCard
    
    attr_accessor :balance, :in_journey
    MAX_BALANCE = 90

    def initialize(balance = 0)
      @balance = balance
      @in_journey = false
    end
   
    def top_up(credit)
      raise 'Cannot exceed maximum amount £90' if balance + credit >= MAX_BALANCE
      @balance += credit
    end
    
    def deduct(amount)
      @balance -= amount
    end  
    
end