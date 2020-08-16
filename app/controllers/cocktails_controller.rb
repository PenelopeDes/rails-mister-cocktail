class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all

    if params[:search]
      @cocktails = @cocktails.select { |cocktail| cocktail.name.downcase.start_with?(params[:search].downcase)}
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    @cocktail.save
    redirect_to cocktails_path
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name, :photo, :description)
  end
end
