class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # skip_before_action :verify_authenticity_token, only: [:create, :update]

  # GET /posts
  # GET /posts.json
  def index
    @post = Post.new
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.image = post_params[:image]
    respond_to do |format|
      if @post.save
        # format.html { redirect_to action: "index", notice: 'Post was successfully created.' }
        format.json { render :index, status: :created, location: @post }
        format.js
      else
        # format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post.image = post_params[:image]
    respond_to do |format|
      if @post.update(post_params)
        # format.html { redirect_to action: "index", notice: 'Post was successfully updated.' }
        format.json { render :index, status: :ok, location: @post }
        format.js
      else
        # format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      # format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :image)
    end
end
