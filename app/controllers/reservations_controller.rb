class ReservationsController < ApplicationController

   def index
    @available_at = Time.now
    @reservations = Reservation.where('user_id' => current_user.id)
    #@reservations = Reservation.all
   end

    def show
    #@reservations = Reservation.where('user_id' => current_user.id)
    #@reservation = Reservation.find_by_id(params[:id]) 
    #@book = Book.find_by_id(@reservation.book_id) 
    #@user = User.find_by_id(@reservation.user_id) 
    #  respond_to do |format|
       # format.html
      #  format.json { render :json => @reservations }
     # end
    end


  	def create
      @reservation = Reservation.new(reservation_params)
      @reservation.user_id = current_user.id
      @reservation.reserved_on = Date.today
      @reservation.due_on  = Date.today + 7

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