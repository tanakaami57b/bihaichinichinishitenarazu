class BookmarksController < ApplicationController
    before_action :authenticate_user!

    def create
      post = Post.find(params[:post_id])
      current_user.bookmark(post)
      redirect_to posts_path, notice: "これやる！リストに追加しました！"
    end

    def destroy
        bookmark = current_user.bookmarks.find_by(id: params[:id])
        if bookmark
          bookmark.destroy
          redirect_to posts_path, notice: "これやる！リストを解除しました！", status: :see_other
        else
          redirect_to posts_path, alert: "ブックマークが見つかりませんでした。", status: :unprocessable_entity
        end
      end
  end
