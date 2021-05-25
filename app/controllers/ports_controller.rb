class PortsController < ApplicationController

  def index
    @ports = Port.all
    @ships = Ship.all
    @ship = Ship.find(params[:ship_id])
    @pirate = Pirate.find(params[:pirate_id])
    @user = User.find(params[:user_id])
  end

  def show
    @port = Port.find(params[:id])
    @ships = Ship.all
    @ship = Ship.find(params[:ship_id])
    @pirate = Pirate.find(params[:pirate_id])
    @user = User.find(params[:user_id])
  end

  def new
    @port = Port.new
  end

  def create
    @port = Port.new(port_params)
    @ports = Port.all
    @ships = Ship.all
    @pirates = Pirate.all
    @ship = Ship.find(params[:ship_id])
    @pirate = Pirate.find(params[:pirate_id])
    @user = User.find(params[:user_id])

    if @port.save
      render :index
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @pirate = Pirate.find(params[:pirate_id])
    @ship = Ship.find(params[:ship_id])
    @port = Port.find(params[:id])
    @port.destroy
    redirect_to index
  end

  private
  def port_params
    params.require(:port).permit(:name, :docks)
  end
end
