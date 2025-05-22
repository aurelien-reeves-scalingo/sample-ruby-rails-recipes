class RecipesController < ApplicationController
  def index
    if params[:search].present?
      @search_term = params[:search]
      @recipes = Recipe.search(params[:search], fields: [:title, :ingredients], limit: 25)
    else
      @recipes = Recipe.order(created_at: :desc).limit(25)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
