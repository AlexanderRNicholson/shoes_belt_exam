class TransactionsController < ApplicationController
    
    def create
        shoe = Shoe.find(params[:id])
        transaction = Transaction.new
        transaction.user_id = shoe.user_id
        transaction.shoe_id = shoe.id
        transaction.product = shoe.name
        transaction.amount = shoe.amount
        transaction.purchased_by = current_user.id
        transaction.buyer_first_name = current_user.first_name
        transaction.buyer_last_name = current_user.last_name
        transaction.save
        unless transaction.save
            flash[:errors] = transaction.errors.full_messages
        end
        shoe.destroy
        redirect_to "/users/<%= current_user.id %>"
        
    end
    
end
