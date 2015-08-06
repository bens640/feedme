class RecipesController < ApplicationController
  before_action :is_admin?, except: :index

  def index
    @recipes = Recipe.all.order('updated_at DESC')
  end
  def new
    @recipe = Recipe.new
    @image = params[:file]
  end
  def create
    @recipe = Recipe.new recipe_params
    @recipe.ingredients = recipe_params[:ingredients].strip.split(',')
    if @recipe.save
      redirect_to recipes_path, flash:{notice: 'recipe created'}
    else
      redirect_to :back, flash:{notice: 'there was an error'}
    end
  end
  def show
    @image = params[:file]
  end
  def edit
    @recipe = Recipe.find(params[:id])
    @recipe.ingredients = JSON.parse(@recipe.ingredients).join(", ")
  end
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path, flash:{notice:"Recipe Destroyed"}
  end
  def update
    recipe = Recipe.find(params.require(:id))
    recipe.title = recipe_params[:title]
    recipe.recipe = recipe_params[:recipe]
    recipe.ingredients = recipe_params[:ingredients].strip.split(',')
    if recipe.save
      redirect_to recipes_path, flash:{notice:"Recipe Modified"}
    end
  end
  private
  def recipe_params
    params.
        require(:recipe).
        permit(:title, :ingredients, :recipe, :image)
  end

end
