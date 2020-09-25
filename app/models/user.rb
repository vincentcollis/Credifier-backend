class User < ApplicationRecord
    has_many :reviews
    
    has_many :posts, through: :reviews
    has_many :ratings, through: :reviews

    has_many :raters, class_name: "Rating", foreign_key: :rater_id, dependent: :destroy

end
