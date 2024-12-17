class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:create]
    before_action :set_comment, only: %i[edit update destroy]
    before_action :authorize_user!, only: %i[edit update destroy]

    def create
      comment = current_user.comments.build(comment_params.merge(post: @post))

      if comment.save
        redirect_to post_path(@post), notice: "コメントしました！"
      else
        redirect_to post_path(@post), alert: "コメントの投稿に失敗しました"
      end
    end

    def edit
    end

    def update
      if @comment.update(comment_params)
        redirect_to post_path(@comment.post), notice: "コメントを更新しました！"
      else
        flash.now[:alert] = "コメントの更新に失敗しました。"
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @comment.destroy
      redirect_to post_path(@comment.post), notice: "コメントを削除しました！"
    end

    private

    def set_post
      @post = Post.find_by(id: params[:post_id])
      redirect_to posts_path, alert: "投稿が見つかりませんでした。" if @post.nil?
    end

    def set_comment
      @comment = Comment.find_by(id: params[:id])
      redirect_to posts_path, alert: "コメントが見つかりませんでした。" if @comment.nil?
    end

    def authorize_user!
      unless current_user&.own?(@comment)
        redirect_to posts_path, alert: "操作は許可されていません。"
      end
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
  end
