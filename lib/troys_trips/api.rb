module TroysTrips
    class API
        require 'uri'
        require 'openssl'
        
        API_HOST = "https://tripadvisor1.p.rapidapi.com/"
        SEARCH_PATH = "locations/search?location_id=1&limit=15&sort=relevance&offset=0&lang=en_US&currency=USD&units=mi&query="
        QUERY = 
        
        ## THIS WAS THE ORIGINAL CODE FROM RAPIDAPI
        #url = URI("https://tripadvisor1.p.rapidapi.com/locations/search?location_id=1&limit=15&sort=relevance&offset=0&lang=en_US&currency=USD&units=mi&query=atlanta")
        
        #http = Net::HTTP.new(url.host, url.port)
        #http.use_ssl = true
        #http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        #request = Net::HTTP::Get.new(url)
        #request["x-rapidapi-host"] = 'tripadvisor1.p.rapidapi.com'
        #request["x-rapidapi-key"] = '7b28c5e982msh8358eac7c198bcep1f819ejsndef392980da1'
        
        #response = http.request(request)
        #puts response.read_body

        ## END ORIGINAL CODE FROM RAPIDAPI
    
        def self.api_key 
            # this method will retrieve the API KEY stored in a file called .yelp_api_key in our root 
            # directory. If the file doesn't exist it will ask us to enter an API key to the terminal 
            # and store our input in that file so that it will be read next time we run the program.
            # We haven't worked with the File class before, so here are a couple of things to note:
            # 1. If we try to open a file that doesn't exist we get an error.
            # 2. If we want to create the file in that case, we can use the begin rescue syntax.
            # 3. If we're able to open a file we can call the read method on it to get its content.
            # 4. A couple extra notes: File.expand_path returns an absolute path and will allow us to use ~ which represents a user's home directory.
            # 5. If the file doesn't exist, we'll want to take the user's input to get their API KEY and store it in a hidden file (one that starts with a .) in their home directory. This way it will be there the next time we run the program and they won't have to enter it again.
            # 6. To create a new file, we can use the File.open method with a second argument, "w", giving us write permissions to the file. Then we can pass a block to this and puts out content into the file
            begin
              @@key = File.open(File.expand_path("~/.tripadv-api-key")).read.strip
            rescue 
              puts "Youre gonna need your TripAdvisor API Key.  Head over to https://rapidapi.com/apidojo/api/tripadvisor1 to obtain one. Once you're done, come back and paste your key here:"
              @@key = gets.strip 
              return if @@key == "exit"
              File.open(File.expand_path("~/.tripadv-api-key"), "w") do |file|
                file.print @@key
              end
            end
            @@key
          end
      
        def self.tripadv_search(location)
            url = "#{API_HOST}#{SEARCH_PATH}"
            params = {
                location: location
            }

            response = HTTP.auth("Bearer #{api_key}").get(url, params: params)
      JSON.parse(response)["hotels"]
        end
    
    
    
    
    
    
    
    
    
    end
end
