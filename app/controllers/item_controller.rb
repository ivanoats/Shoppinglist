class ItemController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = List.new(params[:item])
    if @item.save
      flash[:notice] = 'item has been added!'
      redirect_to @item
    else

    end
  end

end
