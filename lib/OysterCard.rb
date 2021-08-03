class OysterCard
    
    attr_accessor :balance
    MAX_BALANCE = 90
    MIN_BALANCE = 1
    FARE = 1

    def initialize(balance = 0)
      @balance = balance
      @in_journey = false
    end
   
    def top_up(credit)
      raise 'Cannot exceed maximum amount £90' if balance + credit >= MAX_BALANCE
      @balance += credit
    end
       
    def in_journey?
      @in_journey
    end

    def touch_in
      raise 'Insufficient funds' if balance < MIN_BALANCE
      @in_journey = true
    end

    def touch_out
      @in_journey = false
      deduct(FARE)
    end

    private

    def deduct(amount)
      @balance -= amount
    end  

end