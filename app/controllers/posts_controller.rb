class PostsController < ApplicationController
  include Permission
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def index
    if is_admin?
      @posts = filtered_records.order(:title).page params[:page]
    else
      @posts = filtered_records.order(:title).where(user_id: current_user.id).page params[:page]
    end
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
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post №#{params[:id]} was successfully deleted"
  end

  private

  def post_params
    params.require(:post).permit(:title, :date, :body, :status, :user_id)
  end

  def filter_by_status
    Post.send(params[:filter_by].intern)
  end

  def filter_by_author
    Post.joins(:user).where('users.nickname LIKE ?', "%#{params[:search]}%")
  end

  def filtered_records #TODO: refactor
    return Post unless params[:search] || params[:filter_by]



    if params[:search].present?
      filter_by_author
    elsif params[:filter_by].present?
      filter_by_status
    else
      Post
    end
  end

  def record_not_found
    render plain: "404 Not Found", status: 404
  end
end
