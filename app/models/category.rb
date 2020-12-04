class Category < ApplicationRecord
    belongs_to :dish
     mount_uploader :avatar, AvatarUploader
     validates :name, presence:true
     validates :avatar, presence:true

end
