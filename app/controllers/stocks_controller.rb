class StocksController < ApplicationController

    def search
        if params[:stock].present?
            # this looks up the Model def : 
            @stock = Stock.new_lookup(params[:stock])
            #render json: @stock
            if @stock #check if @stock is not nil
                render 'users/my_portfolio'
            else 
                flash[:alert] = "Please enter a valid symbol to search"
                redirect_to my_portfolio_path
            end
        else
            flash[:alert] = "Please enter a valid symbol to search"
            redirect_to my_portfolio_path
        end
    end
end