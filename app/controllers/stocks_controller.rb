class StocksController < ApplicationController

    def search
        if params[:stock].present?
            # this looks up the Model def : 
            @stock = Stock.new_lookup(params[:stock])
            if @stock #check if @stock is not nil
                respond_to do |format|
                  format.js { render partial: 'users/result' }
                end
            else 
                flash[:alert] = "Please enter a valid symbol to search"
                redirect_to my_portfolio_path
            end
        else
            flash[:alert] = "Can't search empty text field"
            redirect_to my_portfolio_path
        end
    end
end