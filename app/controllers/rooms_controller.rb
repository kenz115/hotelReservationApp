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

  def create
    @room = current_user.room.build(room_params)
    if @room.save
      flash[:notice] = "部屋が追加されました。"
      redirect_to @room
    else
      render 'new'
    end
  end

  def edit
  end

  def search
    @rooms = Room.where("address LIKE ?", "%#{params[:area]}%")
  end

  private

    def room_params
      params.require(:room).permit(:name, :address, :introduction, :fee, :image)
    end
end
