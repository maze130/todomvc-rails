class ListsController < ApplicationController

  def index
    @lists = List.order(:id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    redirect_to lists_path
  end

  # def show
  #   #pass in all the tasks for the list
  #   @list = List.find_by(id: params[:id])
  # end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def update
    List.update(params[:id], list_params)
    redirect_to lists_path
  end

  def destroy
    List.destroy(params[:id])
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
