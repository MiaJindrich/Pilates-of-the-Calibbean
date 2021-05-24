class ShipsController < ApplicationController

  def index
    @ships = Ship.all
  end

  def show
    @ship = Ship.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
    @ships = Ship.all

    if @ship.save
      render :index
    else
      render :new
    end

  end

  private
  def ship_params
    params.require(:ship).permit(:name, :capacity)
  end
end
