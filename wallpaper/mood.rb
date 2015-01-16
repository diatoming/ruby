# life motto

# if (mood.state == sad)
#   mood.stop
#   mood.be_awesome

class Mood < Object
  
  attr_accessor :state

  def stop
  end

  def chill
    @state = :chilled
  end

end

mood = Mood.new 

mood.state = :stressed

(mood.stop ; mood.chill) if mood.state == :stressed

p mood.state
