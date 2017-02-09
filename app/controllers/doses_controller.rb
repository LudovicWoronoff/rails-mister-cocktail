class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
    @dose = Dose.new
  end

  def create
    @ingredient = Ingredient.find_by(name:params[:dose][:ingredient])
    @dose = Dose.new
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    @dose.description = params[:dose][:description]
    @ingredient.save
    @cocktail.save
    if @dose.save
    redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # def show
  #   @dose = Dose.find(params[:id])
  # end

  # def index
  #   @doses = Dose.all
  # end

  def destroy

  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end
end




