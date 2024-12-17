class ProfilesController < ApplicationController
    before_action :set_user, only: %i[edit update]

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to profile_path, notice: "更新しました！"
      else
        flash.now[:alert] = "プロフィールの更新に失敗しました。"
        render :edit, status: :unprocessable_entity
      end
    end

    def show
        @user = current_user
    end

    private

    def set_user
      @user = User.find(current_user.id)
    end

    def user_params
      params.require(:user).permit(:name, :email, :profile_image_url)
    end
  end