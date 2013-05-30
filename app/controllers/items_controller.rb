class ItemsController < ApplicationController
  before_filter :set_list
  before_filter :set_item, :only => [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = @list.items.build
  end

  def create
    @item = @list.items.build(item_params)
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
      if @item.update_attributes(item_params)
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

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:image, :name, :note, :tag)
  end

end
