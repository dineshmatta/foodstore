class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @items = Item.all
    respond_with(@items)
  end

  def show
    @cart_action = @item.cart_action current_user.try :id
    respond_with(@item)
    #@item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    respond_with(@item)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    respond_with(@item)
  end

  def update
    @item.update(item_params)
    respond_with(@item)
  end

  def destroy
    @item.destroy
    respond_with(@item)
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :quantity, :price, :pincode, :available_from, :available_to, :pickup_from, :pickup_to, :publish, :user_id, :description, :image)
    end
end
