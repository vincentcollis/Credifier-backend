class Review < ApplicationRecord
    belongs_to :user
    belongs_to :post

    has_many :ratings
end


