class AllyPlace < ApplicationRecord
  belongs_to :place
  def self.find_place(find_place)
    if find_place
        for place in AllyPlace.all
            if place.name == find_place or place.description == find_place
                print "HELLO"
                return place
            end
        end
    else
        error_handle = ['name': 'Nothing', 'Latitude': 'Nothing', 'Longitude': 'Nothing']
        return error_handle

    end
  end
end
