class ReservationsController < ApplicationController
    
    def index
        @reservations = Reservation.where(user_id: current_user.id)
    end
    
    def new
        
        @reservation = Reservation.new(start_date: params[:start_date], end_date: params[:end_date], number_of_peaple: params[:number_of_peaple], room_id: params[:room_id])

        begin
            @days_of_use = (@reservation.end_date.to_date - @reservation.start_date.to_date).to_i
            @total_fee = @reservation.room.fee * @reservation.number_of_peaple * @days_of_use

            if @reservation.end_date.to_date < Date.today || @reservation.start_date.to_date < Date.today
                flash[:danger] = "過去の日付は無効です。"
                redirect_to "/rooms/#{params[:room_id]}"
            elsif @reservation.end_date.to_date < @reservation.start_date.to_date
                flash[:danger] = "終了日は開始日以降の日付を入力してください。"
                redirect_to "/rooms/#{params[:room_id]}"
            end

        rescue
            flash[:danger] = "入力されていない項目があります。"
            redirect_to "/rooms/#{params[:room_id]}"
        end

    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
            flash[:notice] = "予約が完了しました。"
            redirect_to @reservation
        else
            redirect_to root_url
        end
    end

    def show
        @reservation = Reservation.find(params[:id])
        @days_of_use = (@reservation.end_date.to_date - @reservation.start_date.to_date).to_i
        @total_fee = @reservation.room.fee * @reservation.number_of_peaple * @days_of_use
    end

    private

        def reservation_params
            params.require(:reservation).permit(:start_date, :end_date, :number_of_peaple, :user_id, :room_id)
        end
end
