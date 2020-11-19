class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_path)

    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  private

  def params_path
    params.require(:cocktail).permit(:name)
  end
end
