class Client < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :loans
    has_one_attached :image
    belongs_to :user

    def image_url
        if image.attached?
            Rails.application.routes.url_helpers.url_for(image)
        else
           
            nil 
        end
    end
    
end
