class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
    serializer = PostSerializer.new(@post)
    render json: serializer.serializable_hash
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  def politics
    @posts = Post.all
    
    output = @posts.select do |post|
      post.topic == "politics"
    end

    render json: output 
  end

  def sports
    @posts = Post.all
    
    output = @posts.select do |post|
      post.topic == "sports"
    end

    render json: output 
  end

  def science
    @posts = Post.all
    
    output = @posts.select do |post|
      post.topic == "science"
    end

    render json: output 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:content, :source, :image_url, :reporter, :topic)
    end
end
