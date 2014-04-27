class ActivityController < ApplicationController
  def lookup
    require 'net/http'                  # The library we need
    host = 'www.tripadvisor.com'     # The web server
    path = '/Attractions-g294212-Activities-Beijing.html'                 # The file we want

    http = Net::HTTP.new(host)          # Create a connection
    headers, body = http.get(path)      # Request the file
    if headers.code == '200'            # Check the status code
      4.times do |attractionN|
        choppedString=(headers.body).split('a href="/Attraction_Review')
        attractionNamePre=choppedString[2*attractionN+1].split('onclick="">')
        attractionName=attractionNamePre[1].split('</a>')
        @wei=attractionName[0]


        path1='/Attraction_Review'+ choppedString[2*attractionN+1].split('"')[0]
        headers1=http.get(path1)
        if headers1.code == '200'            # Check the status code
          street=((headers1.body).split('street-address">')[1]).split('</span>')[0]
          locality=((headers1.body).split('v:locality">')[1]).split('</span>')[0]
          countryName=((headers1.body).split('v:country-name">')[1]).split('</span>')[0]
          @address=street+', '+locality+', '+countryName
          puts @address
          WeiUser.create(:latitude=>"", :longitude=>"", :address=>@address, :description=>"", :title=>@wei)
        end
      end

    else
      puts "#{headers.code} #{headers.message}"
      @wei="#{headers.code} #{headers.message}"
    end
  end
end
