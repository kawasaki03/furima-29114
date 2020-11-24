class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :ensure_correct_user, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :ensure_purchase, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @item.delete
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :price, :area_id, :category_id, :delivery_time_id, :shipping_charge_id, :condition_id).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    redirect_to root_path unless @item.user == current_user
  end

  def ensure_purchase
    redirect_to root_path if @item.purchase_record
  end
end
