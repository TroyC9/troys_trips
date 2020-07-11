module TroysTrips
    class API
        url = URI("https://tripadvisor1.p.rapidapi.com/hotels/get-details?adults=1&nights=2&currency=USD&lang=en_US&child_rm_ages=7%252C10&checkin=2020-01-15&location_id=10359481")

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
