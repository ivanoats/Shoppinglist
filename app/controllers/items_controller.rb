class ItemsController < ApplicationController
  before_filter :find_list
  #before_filter :find_item, :only => [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = @list.items.build
  end

  def create
    @item = @list.items.build(params[:item])
    if @item.save
      flash[:notice] = 'item has been created.'
      redirect_to [@list, @item]
    else
      flash[:alert] = 'Item has not been created.'
      render :action => 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def find_list
    @list = List.find(params[:list_id])
  end

end
