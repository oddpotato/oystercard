class Journey
  
  def touch_in(station)
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
  end

  def is_complete?
    if @entry_station.nil? || @exit_station.nil?
      false
    else
      true
    end
  end

end