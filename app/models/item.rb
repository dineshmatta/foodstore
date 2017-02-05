class Item < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	belongs_to :user

	def cart_action(current_user_id)
		if $redis.sismember "cart#{current_user_id}", id
		  "Remove from"
		else
		  "Add to"
		end
	end

end
