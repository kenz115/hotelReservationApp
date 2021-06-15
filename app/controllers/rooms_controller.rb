class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def search
    @rooms = Room.where("address LIKE ?", "%#{params[:area]}%")
  end
end
