class ListsController < ApplicationController
  before_filter :find_list, :only => [:edit, :update, :show, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:notice] = 'List has been created!'
      redirect_to @list
    else
      flash[:alert] = "List has not been created.#{@list.errors[:name]}"
      render :action => 'new'
    end
  end

  def edit

  end

  def update
    if @list.update_attributes(params[:list])
      flash[:notice] = 'List has been updated.'
      redirect_to @list
    else
      flash[:alert] = 'List has not been updated.'
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

  def find_list
    @list = List.find(params[:id])
  end

end
