require "http"
require "pry"
require "httparty"
require "openssl"
require "net/http"
require_relative "troys_trips/version"
require_relative "troys_trips/api"
require_relative "troys_trips/cli"
require_relative "troys_trips/hotels"


module TroysTrips
  class Error < StandardError; end
  # Your code goes here...
end
