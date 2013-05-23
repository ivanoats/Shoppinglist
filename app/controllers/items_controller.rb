class ItemsController < ApplicationController
  before_filter :find_list
  before_filter :find_item, :only => [:show, :edit, :update, :destroy]

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
      flash[:alert] = "Item has not been created. NAME #{(@item.errors[:name][0]).upcase}"
      render :action => 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item has been updated.'
        redirect_to [@list, @item]
      else
        flash[:error] = 'Item has not been updated.'
        render :action => 'edit'
      end
  end

  def destroy
    @item.destroy
    flash[:notice] = 'Item has been deleted.'
    redirect_to @list
  end

  def find_list
    @list = List.find(params[:list_id])
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
