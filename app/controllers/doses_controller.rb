class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]
  
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    ingredient_id = params[:dose][:ingredient_id]
    @dose.ingredient = Ingredient.find(ingredient_id)
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new_cocktail
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
  
  def dose_params
    params.require(:dose).permit(:description)
  end
end
