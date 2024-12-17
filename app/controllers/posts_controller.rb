class PostsController < ApplicationController
  # ログインを必須にしないアクションを指定
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.includes(:user)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    # @post は before_action によって設定済み
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿を更新しました！"
    else
      flash.now[:alert] = "投稿の更新に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました！"
  end

  def bookmarks
    @bookmark_posts = current_user.bookmark_posts.includes(:user).order(created_at: :desc)
  end


  private

  def set_post
    @post = Post.find_by(id: params[:id])
    redirect_to posts_path, alert: "投稿が見つかりませんでした。" if @post.nil?
  end

  def post_params
    params.require(:post).permit(:title, :content, :required_time, :required_cost, :parts, :image_url)
  end
end
