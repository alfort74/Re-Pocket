class HomeController < ApplicationController
  def index
  	if session[:token]
  		client = Pocket.client(:access_token => session[:token])
  		info = client.retrieve(:detailType => :simple, :favorite => 1)
  		@items = info["list"].to_a.sort_by{ rand }.take(9).map{|v| v[1]}
  		@items.each do |item|
  			results, errors = Scouter.get_count(item["resolved_url"])
  			results.each do |url, service|
  				item["pocket"] = service.pocket
  				item["hatena"] = service.hatenabookmark
  				item["twitter"] = service.twitter
  			end
  		end
  	else
  		@items = []
  	end
  end
end
