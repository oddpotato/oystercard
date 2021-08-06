require_relative 'journey'

class OysterCard
    
    attr_reader :entry_station, :exit_station, :balance, :current_journey, :journeys

    MAX_BALANCE = 90
    MIN_BALANCE = 1
    FARE = 1

    def initialize(balance = 0)
      @balance = balance
      @journeys = [] #-- JD
    end
   
    def top_up(credit)
      raise 'Cannot exceed maximum amount £90' if balance + credit >= MAX_BALANCE
      @balance += credit
    end
       
    def in_journey?
      @current_journey.is_complete? ? false : true
    end

    def touch_in(station)
      raise 'Insufficient funds' if balance < MIN_BALANCE
      @current_journey = Journey.new #-- Hash.new #-- JD
      @current_journey.touch_in(station)
    end

    def touch_out(station)
      deduct(FARE)
      current_journey.touch_out(station)
      @journeys << @current_journey #-- JD
    end

    private

    def deduct(amount)
      @balance -= amount
    end  

end