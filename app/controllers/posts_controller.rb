class PostsController < ApplicationController
  include Permission
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @posts = Post.order(:title).page params[:page]
    @posts = @posts.where(user_id: current_user.id) unless is_admin?
    @posts = @posts.joins(:user).where('users.nickname LIKE ?', "%#{params[:search]}%") if params[:search]
    @posts = @posts.send(params[:status].intern) if params[:status]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.date = Time.current
    if @post.save
      redirect_to @post, notice: "Post was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to posts_path, notice: "Post №#{params[:id]} was successfully deleted"
  end

  private

  def post_params
    params.require(:post).permit(:title, :date, :body, :status, :user_id)
  end

  def record_not_found
    render plain: "404 Not Found", status: 404
  end
end
