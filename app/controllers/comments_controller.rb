class CommentsController < ApplicationController
    # コメント投稿、編集、削除はログイン必須
    before_action :authenticate_user!

    def create
        post = Post.find_by(id: params[:post_id])

        if post.nil?
          redirect_to posts_path, alert: "投稿が見つかりませんでした。"
          return
        end

        comment = current_user.comments.build(comment_params.merge(post: post))

        if comment.save
          redirect_to post_path(post), notice: "コメントしました！"
        else
          redirect_to post_path(post), alert: "コメントの投稿に失敗しました"
        end
      end
      

    def edit
      @comment = current_user.comments.find_by(id: params[:id])
      if @comment.nil?
        redirect_to posts_path, alert: "編集するコメントが見つかりませんでした。"
      end
    end

    def update
      @comment = current_user.comments.find_by(id: params[:id])

      if @comment&.update(comment_params)
        redirect_to post_path(@comment.post), notice: "コメントを更新しました！"
      else
        flash.now[:alert] = "コメントの更新に失敗しました。"
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      comment = current_user.comments.find_by(id: params[:id])

      if comment&.destroy
        redirect_to post_path(comment.post), notice: "コメントを削除しました"
      else
        redirect_to post_path(comment.post), alert: "コメントの削除に失敗しました"
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end
  end
