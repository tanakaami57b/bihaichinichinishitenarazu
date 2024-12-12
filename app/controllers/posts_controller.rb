class PostsController < ApplicationController
    # ログインを必須にしないアクションを指定
  skip_before_action :authenticate_user!, only: [:index, :show]

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
      @post = Post.find(params[:id]) # 修正: params[:id] を使用
      @user = @post.user
    end


  private

  def post_params
    params.require(:post).permit(:title, :content, :required_time, :required_cost, :parts, :image_url)
  end
end