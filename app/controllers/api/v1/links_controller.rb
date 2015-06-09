module Api
  module V1
		class LinksController < ApplicationController
			def create
		    follower = Business.find(params[:follower_id])
		    follower.follow(params[:followed_id])
		    render json: follower.to_json(:include => [:links,:businesses_in_network])
		  end

		  def destroy
		  	link = Link.find(params[:id])
		  	link.follower.unfollow(link.followed.id)
		    render json: link.follower.to_json(:include => [:links,:businesses_in_network])
		  end
		end
	end
end

