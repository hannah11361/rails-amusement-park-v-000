class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  #"Sorry. You do not have enough tickets to ride the #{attraction.name}."
  # "Sorry. You are not tall enough to ride the #{attraction.name}."

  def take_ride
    messages = ["Sorry.","You do not have enough tickets to ride the #{attraction.name}.", "You are not tall enough to ride the #{attraction.name}."]
    if attraction.tickets > user.tickets && attraction.min_height > user.height
      return messages.join(" ")
    elsif attraction.tickets > user.tickets
      return messages[0] + " " + messages[1]
    elsif attraction.min_height > user.height
      return messages[0] + " " + messages[2]
    else #eligible to ride
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
