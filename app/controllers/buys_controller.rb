class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @buy_destination = BuyDestination.new
  end

  def create
    @buy_destination = BuyDestination.new(buy_params)
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

  def set_item
    @item = Item.find(params[:item_id])
  end
end
