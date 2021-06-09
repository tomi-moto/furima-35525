class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, except: [:create, :index]
  before_action :move_to_index, only: [:index, :create]
  before_action :sold_out, only: [:index, :create]

  def index
    @order_user = OrderUser.new
  end

  def create
    @order_user = OrderUser.new(order_params)
    if @order_user.valid?
      pay_item
      @order_user.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order_user).permit(:post_num, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id:current_user.id, item_id:params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user
  end

  def sold_out
    if @item.purchase_record.present?
      redirect_to root_path
    end
  end


end

