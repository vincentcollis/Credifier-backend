class Review < ApplicationRecord
    belongs_to :user
    belongs_to :post

    has_many :ratings

    def review_rating 
        score_array = []
        self.ratings.each do |rating|
            score_array << rating.score

        end
        
    # (score_array.reduce(:+) / score_array.size).round(2)
    (score_array.inject{ |sum, el| sum + el }.to_f / score_array.size).round(2)
    end 
end


