class PostsController < ApplicationController
    def index
        # byebug
        @posts=Post.all
        # @posts = Post.order(created_at: :desc).page params[:page]
        # @users = User.order(:name).page params[:page]
        # @posts=Post.page(params[:page])
 # User.page(page_number).per(records_per_page)

        # @posts = Post.order(created_at: :desc)
    end
    def create
      user=current_user
      Post.create(post_params)
      redirect_to user_path(user)
    end

    def show
        
        @post = Post.find(params[:id])
        # post = current_user.posts.find(params[:id])
        # byebug
    end

    def destroy
        @post = current_user.posts.find(params[:id])
        @post.destroy
        redirect_to user_path(current_user)
    end
    private
    def post_params
      params.require(:post).permit(:description, :image, :user_id,:query)
    end
end
