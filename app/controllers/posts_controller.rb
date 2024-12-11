class PostsController < ApplicationController
    # ログインを必須にしないアクションを指定
  skip_before_action :authenticate_user!, only: [:index, :show]

    def index
        @posts = Post.includes(:user)
      end

    def show
      @post = Post.find(:id)
      @user = @post.user
    end
  end