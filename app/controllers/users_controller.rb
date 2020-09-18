class UsersController < ApplicationController
    def show
        # @posts = current_user.posts.order(created_at: :desc)

        @user  = User.find(params[:id])
        @posts = @user.posts.order(created_at: :desc)
        # @user =User.find(params[:query])
        @query = params[:query] 
        if(@query)
            redirect_to search_path(query: @query)
            
        end
  

        # byebug
  
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        current_user.update(user_params)
        redirect_to current_user
    end


    private

    def user_params
        params.require(:user).permit(:username, :name, :website,
                    :bio, :email, :phone, :gender, :avatar,:query)
    end
end
