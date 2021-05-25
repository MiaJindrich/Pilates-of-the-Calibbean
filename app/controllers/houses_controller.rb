class HousesController < ApplicationController

  def index
    @houses = House.where(:pirate_id => nil)
    @user = User.find(params[:user_id])
    @pirate = Pirate.find(params[:pirate_id])
  end

  def create
    @user = User.find(params[:user_id])
    @pirate = Pirate.find(params[:pirate_id])
    @house = House.new
    @house.save
    redirect_to user_pirate_houses_path(@user, @pirate)
  end
end
