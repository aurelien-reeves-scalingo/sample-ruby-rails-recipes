class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order(created_at: :desc).limit(25)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def search
    # to be implemented
  end
end
