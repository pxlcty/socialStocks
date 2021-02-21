class UserStocksController < ApplicationController

    def create
        stock = Stock.check_db(params[:ticker]) # does ticker exist within current table?
        if stock.blank? # if stocks does not currently exist in table
            stock = Stock.new_lookup(params[:ticker]) 
            stock.save
        end
        @user_stock = UserStock.create(user: current_user, stock: stock)
        flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
        redirect_to my_portfolio_path
    end

end
