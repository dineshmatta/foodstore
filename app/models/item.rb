class Item < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	belongs_to :user

	def poster
		"http://ia.media-imdb.com/images/M/#{poster_url}"
	end

	def imdb
		"http://www.imdb.com/title/#{imdb_id}/"
	end

	def cart_action(current_user_id)
		if $redis.sismember "cart#{current_user_id}", id
		  "Remove from"
		else
		  "Add to"
		end
	end

end
