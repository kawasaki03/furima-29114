class OrdersController < ApplicationController
  before_action :ensure_purchase, only:[:index, :create]
  before_action :ensure_correct_user, only:[:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid? 
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order).permit(:postal_code,:area_id,:city,:house_number,:building_name,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token],price: @item.price)
  end

  def ensure_purchase
    @item = Item.find(params[:item_id])
    if @item.purchase_record
      redirect_to root_path
    end
  end

  def ensure_correct_user
    if @item.user == current_user
      redirect_to root_path 
    end
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price], 
        card: order_params[:token],
        currency: 'jpy'  
      )
  end



end