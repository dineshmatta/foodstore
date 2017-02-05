class SearchLocationController < ApplicationController
  def index
  	p current_user.methods
  	if !current_user.nil?
  		redirect_to items_path
  	end
  end
end
