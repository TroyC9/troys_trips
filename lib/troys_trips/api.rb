module TroysTrips
    class API
        require 'uri'
        require 'net/http'
        require 'openssl'
        
        url = URI("https://tripadvisor1.p.rapidapi.com/locations/search?location_id=1&limit=30&sort=relevance&offset=0&lang=en_US&currency=USD&units=km&query=atlanta")
        
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'tripadvisor1.p.rapidapi.com'
        request["x-rapidapi-key"] = '7b28c5e982msh8358eac7c198bcep1f819ejsndef392980da1'
        
        response = http.request(request)
        puts response.read_body
    end
end
