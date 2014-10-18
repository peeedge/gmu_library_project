class ReservationsController < ApplicationController

   def index
    @available_at = Time.now
    @reservations = Reservation.all
   end

    def show
      @reservations = Reservation.joins(:user).where('book_id' => params[:book_id]).select("users.*,reservations.*")
      @bookid = params[:book_id]

      respond_to do |format|
        format.html
        format.json { render :json => @reservations }
      end
    end


  	def create
      @reservation = Reservation.new(reservation_params)
      @reservation.user_id = current_user.id

      respond_to do |format|
        if @reservation.save
          format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
          format.json { render :show, status: :created, location: @reservation }
        else
          format.html { render :show }
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      end 
  	end

  	def update
  		@reservation.update(reservation_params)
  		redirect_to @reservation
  	end

  	def destroy
  		@reservation.destroy
  		redirect_to reservations_url
  	end

  	def reservation_params
  		params.require(:reservation).permit(:book_id)
      #params.require(:reservation).permit(:reserved_on, :due_on, :user_id, :book_id, :created_at, :updated_at)
  	end
  	
    #before_create :set_reserved_on,

  	#def set_reserved_on
  	# @reservation = Reservation.find(params[:id])
  	#end

  end