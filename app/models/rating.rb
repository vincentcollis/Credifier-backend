class Rating < ApplicationRecord
    belongs_to :review
    belongs_to :user
    belongs_to :rater, class_name: "User", foreign_key: "rater_id"

    # belongs_to :followed, class_name: "Fan", foreign_key: :followed_id
end
