class Rating < ApplicationRecord
    validates :rater_id, uniqueness: {scope: :review_id, message: "User cannot rate a review more then once!"}

    belongs_to :review
    belongs_to :rater, class_name: "User", foreign_key: "rater_id"
end
