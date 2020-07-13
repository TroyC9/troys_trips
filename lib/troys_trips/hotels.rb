module TroysTrips
    class Hotels
        @@all = []

        def self.all 
          @@all
        end
    
        def self.load_by_location(location)
          location_based_search_results = API.tripadv_search(location)
          @@all = self.create_from_search_results(location_based_search_results)
        end
    
        def self.create_from_search_results(search_results)
          search_results.map do |hotel_info_hash|
            self.new(hotel_info_hash)
          end
        end
    
        attr_accessor :location_id, :name, :review_count, :snippet, :address
    
        def initialize(attributes={})
          attributes.each do |attribute_name,attribute_value|
            if self.respond_to?("#{attribute_name}=")
              self.send("#{attribute_name}=", attribute_value)
            end
          end
         
        end
    end
end
