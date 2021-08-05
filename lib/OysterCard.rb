class OysterCard
    
    attr_reader :entry_station, :exit_station, :balance, :current_journey, :journeys

    MAX_BALANCE = 90
    MIN_BALANCE = 1
    FARE = 1

    def initialize(balance = 0)
      @balance = balance
      @entry_station = nil
      @journeys = []
    end
   
    def top_up(credit)
      raise 'Cannot exceed maximum amount £90' if balance + credit >= MAX_BALANCE
      @balance += credit
    end
       
    def in_journey?
      !@entry_station.nil?
    end

    def touch_in(station)
      raise 'Insufficient funds' if balance < MIN_BALANCE
      @entry_station = station
      @current_journey = Hash.new
      @current_journey[:entry_station] = station
    end

    def touch_out(station)
      deduct(FARE)
      @entry_station = nil
      @exit_station = station
      @current_journey[:exit_station] = station
      @journeys << @current_journey
    end

    private

    def deduct(amount)
      @balance -= amount
    end  

end

#Upon touch in, check if a journey is in progress?* a new journey is created, and set to "in progress" with an entry station.
#Upon touch out, check if no journey is in progress?** we take an exit station argument, and add that variable to the journey class.
#Lastly, the journey class will create a hash using the entry and exit stations.
#That hash will be added to the journeys array in the card.

#*If a journey is already in progress when attempting to touch in, no new journey is created. And a penalty is added to the existing one, and it is then archived.

#def touch_out(station)

# exit_station = station
#journey.finish(exit_station)