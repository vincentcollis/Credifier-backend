class User < ApplicationRecord
    

    has_many :reviews
    
    has_many :posts, through: :reviews
    has_many :ratings, through: :reviews

    has_many :raters, class_name: "Rating", foreign_key: :rater_id, dependent: :destroy




    # Find avg scorce of rating
    def my_score 
        
        score_array = []
        self.reviews.each do |review|
            review.ratings.each do |rating|
                score_array << rating.score
            end
        end 
        return (score_array.inject{ |sum, el| sum + el }.to_f / score_array.size).round(1)
        
        # (score_array.reduce(:+) / (score_array.size)).round(2)
        # avg_score.round(2)
    end

    def ranking
        if self.my_score < 4
            rank= "red"
        elsif self.my_score >= 4 && self.my_score < 7
            rank= "yellow"
        elsif self.my_score >= 7
            rank= "green"
        end
        return rank
        byebug
    end
end
