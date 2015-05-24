module Api
  module V1
		class LinksController < ApplicationController
			def create
		    follower = Business.includes(:businesses_in_network).find(params[:follower_id])
		    Rails.logger.info follower.businesses_in_network.map { |e| e.name }
		    followed = Business.find(params[:followed_id])
		    follower.toggle_follow(followed)
		    Rails.logger.info follower.businesses_in_network.map { |e| e.name }
		    render json: follower.to_json(:include => :businesses_in_network)
		  end
		end
	end
end

