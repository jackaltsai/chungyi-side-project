class Project < ApplicationRecord
    validates_presence_of :name
    mount_uploader :image, PhotoUploader
end
