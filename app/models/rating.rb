class Rating < ApplicationRecord


    belongs_to :review
    
    belongs_to :rater, class_name: "User", foreign_key: "rater_id"

    
end
