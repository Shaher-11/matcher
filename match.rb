
#  sense for each user we have this information:
#  ● ID
#  ● Home location (lat, long)
#  ● Work location (lat long)
#  ● Usage mode: Car-owner OR Passenger

#will do the macthing only for the users that are going to the same distination 

def match(user1, user2)
  unless user1.work_location.nil? || user2.work_location.nil? && user1.usage_mode == "passenger" #Make sure both users have work locations and we are matching for the car owner
    if user1.work_location == user2.work_location               #Check they both are going to the same distination
      if user1.home_location == user2.home_location             #Check if they both live in the same area
        "Yay we have a match!!!"
        set_route(passanger_location: user2.home_location)      #set the car owner route to the passanger location
      elsif nearby_location(user: user1)                        #Helper method to get the nearby location and select the first one
        "Found a match, companion address is #{user2.home_location}"
        set_route(passanger_location: user2.home_location)
      else
        "No Match Found, turn on the music!"
      end
    end
  end 
end

def set_route(passanger_location:)
  #direct the car owner to the the passnager location then direct to work_location once pick is confirmed
end

def nearby_location(user:)
  Location.within(15, :units => :kms, :origin => user.home_location).first #Assuming we use something like Geocoder or Geokit Rails it will get the first record within 15 kilometers
end

#Worth mentioning that it's intuitive to have the home_location and work_location helper methods
