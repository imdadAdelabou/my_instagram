class PostsController < ApplicationController
    before_action :set_post, only: [:show, :destroy, :edit, :update]

    def index
        @posts = Post.all
    end

    def new
        if params[:back]
            @post = Post.new(get_params)
        else
            @post = Post.new
        end
    end

    def create
        @post = Post.new(get_params)
        @post.user_id = current_user.id
        if params[:back]
            render :new
        else
            if @post.save
                redirect_to posts_path, notice: "Photo Correctement Ajouté"
            else
                render :new
            end
        end
    end

    def show
    end

    def update
        if @post.update(get_params)
            redirect_to posts_path, notice: "Modification successfully completed"
        else
            render :edit
        end
    end

    def edit
    end

    def confirm
        @post = Post.new(get_params)
        @post.user_id = current_user.id
        render :new if @post.invalid?
    end

    def destroy
        @post.destroy
        redirect_to posts_path, notice: "Post supprimé avec succes"
    end
    
    private

    def get_params
        params.require(:post).permit(:image, :image_cache)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
