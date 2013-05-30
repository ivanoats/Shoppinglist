class ListsController < ApplicationController
  before_action :set_list, :only => [:edit, :update, :show, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = 'List has been created!'
      redirect_to @list
    else
      flash[:error] = "List has not been created. NAME #{(@list.errors[:name][0]).upcase}"
      render :action => 'new'
    end
  end

  def edit

  end

  def update
    if @list.update_attributes(list_params)
      flash[:notice] = 'List has been updated.'
      redirect_to @list
    else
      flash[:error] = "List has not been updated. #{(@list.errors[:name][0]).upcase}"
      render :action => 'edit'
    end
  end

  def show

  end

  def destroy
    @list.destroy
    flash[:notice] = 'List has been deleted'
    redirect_to lists_path
  end

  def set_list
    @list = List.find(params[:id])
  end

  private
  def list_params
    params.require(:list).permit(:category, :name, :publicity, :status)
  end

end
