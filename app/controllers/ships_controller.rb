class ShipsController < ApplicationController

  def index
    @ships = Ship.all
    @pirates = Pirate.all
    @pirate = Pirate.find(params[:pirate_id])
    @user = User.find(params[:user_id])
  end

  def show
    @ship = Ship.find(params[:id])
    if @ship.port_id != nil
      @port = Port.find(@ship.port_id)
    end
    @pirates = Pirate.all
    @pirate = Pirate.find(params[:pirate_id])
    @user = User.find(params[:user_id])
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
    @ships = Ship.all
    @pirates = Pirate.all
    @pirate = Pirate.find(params[:pirate_id])
    @user = User.find(params[:user_id])

    if @ship.save
      render :index
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @pirate = Pirate.find(params[:pirate_id])
    @sailors = Pirate.where(:ship_id => params[:id])
    @sailors.each {|sailor|
      sailor.status = "commoner"
      sailor.save}
    @ship = Ship.find(params[:id])
    @ship.destroy
    redirect_to index
  end

  def dock
    @user = User.find(params[:user_id])
    @pirate = Pirate.find(params[:pirate_id])
    @pirates = Pirate.all
    @ship = Ship.find(params[:ship_id])
    @port = Port.find(params[:id])
    @ship.port_id = @port.id
    @ship.save
    render :show
  end

  def undock
    @user = User.find(params[:user_id])
    @pirate = Pirate.find(params[:pirate_id])
    @pirates = Pirate.all
    @ship = Ship.find(params[:id])
    @ship.port_id = nil
    @ship.save
    render :show
  end

  private
  def ship_params
    params.require(:ship).permit(:name, :capacity)
  end
end
