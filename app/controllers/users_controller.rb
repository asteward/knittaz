class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @current_user = current_user
  end

  def search
    @search_text = params[:search_term]
    @search_results = User.fuzzy_search(name: @search_text)
    render('search/results.html.erb')
  end
end
