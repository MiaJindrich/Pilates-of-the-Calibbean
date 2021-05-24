class PiratesController < ApplicationController

  def show
    @pirate = Pirate.find(params[:id])
    @user = User.find(@pirate.user_id)
    if @pirate.ship_id != nil
      @ship = Ship.find(@pirate.ship_id)
    end
  end

  def create
    @user = User.find(params[:user_id])
    @pirate = @user.pirates.create(pirate_params)
    redirect_to user_path(@user)
  end

  def destroy
    @pirate = Pirate.find(params[:id])
    @user = User.find(@pirate.user_id)
    @pirate.destroy
    redirect_to user_url(@user)
  end



  private
  def pirate_params
    params.require(:pirate).permit(:name)
  end

end
