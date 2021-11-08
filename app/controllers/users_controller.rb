class UsersController < ApplicationController
    before_action :set_post, only: [:show, :destroy, :edit, :update]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user.id)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def update
        puts params
        puts "===>>><<===="
        if @user.update(user_params)
            puts @user.image.url
            redirect_to user_path(@user.id), notice: "Modification successfully completed"
        else
            render :edit
        end
    end

    def edit
       
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
    end

    def update_user
        params.require(:user).permit(:name, :image, :image_cache)
    end

    def set_post
        @user = User.find(params[:id])
    end
end
