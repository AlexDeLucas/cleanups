class Cleanup < ApplicationRecord
    validates :date, presence: true
    validates :location, presence: true
    validates :volunteer_num, presence: true
    validates :trash_pounds, presence: true
    
    belongs_to :user

    mount_uploader :cleanup_pic, CleanupPicUploader

end
