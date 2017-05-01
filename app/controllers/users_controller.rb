class UsersController < ApplicationController
    
    def show
        @unsold_shoes = Shoe.where(user_id: current_user.id)
        @sales = Transaction.where(user_id: current_user.id)
        @sales_sum = 0
        @purchases = Transaction.where(purchased_by: current_user.id)
        @purchases_sum = 0
    end
    
        def create
            @user = User.new(user_params)
            puts @user
            if @user.save
              session[:user_id] = @user.id
                redirect_to "/shoes"
            else
              flash[:errors] = @user.errors.full_messages
              redirect_to "/sessions/new"
            end
        end
    
    def update
      @user = User.find(params[:id])
    if @user.update user_params
      redirect_to "/shoes"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end
    end
    
    def destroy
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
