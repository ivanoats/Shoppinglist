class ListsController < ApplicationController
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

    end
  end

  def show
    @list = List.find(params[:id])
  end
end
