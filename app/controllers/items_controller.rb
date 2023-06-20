class ItemsController < ApplicationController
  def index
    @items = Item.all
    @cart_items = Item.where(in_cart: true)
  end

  def create
    @item = Item.new(item_params)
    @item.in_cart = true # Actualiza el atributo in_cart
    if @item.save
      redirect_to root_path, notice: 'Item agregado a la lista.'
    else
      @items = Item.all
      render :index
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path, notice: 'Item eliminado de la lista.'
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity)
  end
end
