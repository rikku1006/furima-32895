class PurchaseRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :sold_out_item_move_to_index, only: [:index, :create]
  def index
    @purchase_information = PurchaseInformation.new
  end

  def create
    @purchase_information = PurchaseInformation.new(purchase_information_params)
    if @purchase_information.valid?
      pay_item
      @purchase_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_information_params
    params.require(:purchase_information).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_information_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user
  end

  def sold_out_item_move_to_index
    redirect_to root_path if @item.purchase_record.present?
  end
end
