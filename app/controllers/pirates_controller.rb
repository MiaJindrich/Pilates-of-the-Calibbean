class PiratesController < ApplicationController

  def show
    @pirate = Pirate.find(params[:id])
    @user = User.find(@pirate.user_id)
    @ships = Ship.all
    @houses = House.all
    if @pirate.ship_id != nil
      @ship = Ship.find(@pirate.ship_id)
    end
  end

  def create
    @user = User.find(params[:user_id])
    @pirate = @user.pirates.create(pirate_params)
    redirect_to user_path(@user)
  end

  def update
    @pirate = Pirate.find(params[:id])
  end

  def destroy
    @pirate = Pirate.find(params[:id])
    @user = User.find(@pirate.user_id)
    @pirate.destroy
    redirect_to user_url(@user)
  end

  def onboard
    @user = User.find(params[:user_id])
    @ship = Ship.find(params[:id])
    @pirate = Pirate.find(params[:pirate_id])
    @houses = House.where(:pirate_id => nil)
    @pirate.ship_id = @ship.id
    @pirate.status = "sailor"
    @pirate.save
    render :show
  end

  def unboard
    @user = User.find(params[:user_id])
    @houses = House.where(:pirate_id => nil)
    @pirate = Pirate.find(params[:pirate_id])
    @pirate.ship_id = nil
    @pirate.status = "commoner"
    @pirate.save
    render :show
  end

  def buy_house
    @pirate = Pirate.find(params[:pirate_id])
    @house = House.find(params[:id])
    if can_afford_to_buy?(@pirate, @house)
      buy(@pirate, @house)
      redirect_to user_pirate_houses_path, notice: "House bought successfully!"
    else
      redirect_to user_pirate_houses_path, notice: "Not enough gold!"
    end
  end

  def plunder
    @user = User.find(params[:user_id])
    @pirate = Pirate.find(params[:id])
    @pirate.gold += rand(5..15)*100
    @pirate.save
    redirect_to user_pirate_path, notice: "Plundering successful!"
  end

  private
  def pirate_params
    params.require(:pirate).permit(:name)
  end

  def can_afford_to_buy?(pirate, house)
    pirate.gold >= house.price
  end

  def buy(pirate, house)
    pirate.gold -= house.price
    pirate.prestige += house.prestige
    house.pirate_id = pirate.id
    pirate.save
    house.save
  end

end
