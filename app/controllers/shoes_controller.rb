class ShoesController < ApplicationController
    
    def index
        @shoes = Shoe.where.not(user_id: current_user.id)
    end
    
    def show
        
    end
    
    def create
        shoe = Shoe.new shoe_params
        shoe.user_id = current_user.id
        shoe.save
        unless shoe.save
            flash[:errors] = shoe.errors.full_messages
        end
        redirect_to "/users/#{current_user.id}"
    end
    
    def destroy
        @shoe = Shoe.find(params[:id])
        @shoe.destroy
         redirect_to "/users/#(current_user.id}"
    end
    
    private
        def shoe_params
            params.require(:shoe).permit(:name, :amount)
        end
end
