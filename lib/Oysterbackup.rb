require_relative 'journey'

class OysterCard
    
    attr_reader :entry_station, :exit_station, :balance, :current_journey, :journeys, :injourney

    MAX_BALANCE = 90
    MIN_BALANCE = 1
    FARE = 1
    PENALTY_FARE = 6

    def initialize(balance = 0)
      @balance = balance
      @journeys = []
    end
   
    def top_up(credit)
      raise 'Cannot exceed maximum amount £90' if balance + credit >= MAX_BALANCE
      @balance += credit
    end

    def touch_in(station)
      raise 'Insufficient funds' if balance < MIN_BALANCE
      if injourney.nil? || injourney.injourney.false?
        injourney = Journey.new
        puts injourney.injourney
        @current_journey = Hash.new
        @current_journey[:entry_station] = station
      else 
        injourney = false
        @current_journey[:exit_station] = 'ERROR'
        deduct(PENALTY_FARE)
        @journeys << current_journey
        injourney = Journey.new
        @current_journey = Hash.new
        @current_journey[:entry_station] = station
      end
    end

    def touch_out(station)
        if injourney.injourney.true?
           injourney = false
           @current_journey[:exit_station] = station
           @journeys << current_journey
           deduct(FARE)
        else 
            injourney = Journey.new
            @current_journey = Hash.new
            @current_journey[:entry_station] = 'ERROR'
            @current_journey[:exit_station] = station
            @journeys << current_journey
            deduct(PENALTY_FARE)
        end
      deduct(FARE)
    end

    private

    def deduct(amount)
      @balance -= amount
    end  

end
