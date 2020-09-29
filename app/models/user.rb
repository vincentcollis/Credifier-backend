class User < ApplicationRecord
    

    has_many :reviews
    
    has_many :posts, through: :reviews
    has_many :ratings, through: :reviews

    has_many :raters, class_name: "Rating", foreign_key: :rater_id, dependent: :destroy


    def ranking
        case 
        when self.my_score < 40
            rank = "red"
        when self.my_score >= 40 && self.my_score < 70
            rank = "yellow"
        when self.my_score >= 70
            rank = "green"
        end
    end

    # Find avg scorce of rating
    def my_score 
        
        score_array = []
        self.reviews.each do |review|
            review.ratings.each do |rating|
                score_array << rating.score
            end
        end 
        # score_array.inject{ |sum, el| sum + el }.to_f / score_array.size
        (score_array.reduce(:+) / score_array.size).round(2)
    end
end
