class BuysController < ApplicationController

  def index
    @buy_destination = BuyDestination.new
    @item =Item.find(params[:item_id])
  end

  def create
    @buy_destination = BuyDestination.new(buy_params)
    @item =Item.find(params[:item_id])
    if @buy_destination.valid?
      @buy_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_destination).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
