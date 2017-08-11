require "otlet/version"

# https://github.com/bitbucket-rest-api/bitbucket

module Otlet
  def self.scramble(array)
    array.shuffle

  rescue NoMethodError
  	puts 'Error!'
  end
end
