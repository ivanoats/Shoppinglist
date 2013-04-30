class ListsController < ApplicationController
  def index

  end

  def new
    @list = List.new
  end
end
