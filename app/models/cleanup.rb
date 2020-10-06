class Cleanup < ApplicationRecord
    validates :title, presence: true
    validates :posted_by, presence: true
    validates :date, presence: true
    validates :state, presence: true
    validates :city, presence: true
    validates :cleanup_type, presence: true
    validates :volunteers, presence: true
    validates :total_trash, presence: true
    belongs_to :user

    mount_uploader :cleanup_photo, CleanupPhotoUploader
end 