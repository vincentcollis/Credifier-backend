class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :update, :destroy]

  # GET /ratings
  def index
    @ratings = Rating.all
    serializer = RatingSerializer.new(@ratings).serializable_hash
    render json: serializer
  end

  # GET /ratings/1
  def show
    @rating = Rating.find(params[:id])
    serializer = RatingSerializer.new(@rating)
    render json: serializer.serializable_hash
  end

  # POST /ratings
  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      render json: @rating, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ratings/1
  def update
    if @rating.update(rating_params)
      render json: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ratings/1
  def destroy
    @rating.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rating_params
      params.require(:rating).permit(:score)
    end
end
