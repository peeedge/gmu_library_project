class ReservationsController < ApplicationController

   def index
    @available_at = Time.now
    @myreservations = Reservation.where('user_id' => current_user.id).order(:due_on).page(params[:page])
    @allreservations = Reservation.order(:due_on).page(params[:page])
   end

    def show
    @reservation = Reservation.find_by_id(params[:id]) 
    @book = Book.find_by_id(@reservation.book_id) 
    @user = User.find_by_id(@reservation.user_id) 
    #  respond_to do |format|
       # format.html
      #  format.json { render :json => @reservations }
     # end
    end


  	def create
        @reservation = Reservation.new(reservation_params)
        #@overdue = Reservation.new(reservation_params)

          @reservation.user_id = current_user.id
          @reservation.reserved_on = Date.today

          #@overdue.user_id = current_user.id
          #@overdue.reserved_on = Date.today
          #@overdue.due_on  = Date.today - 7

            respond_to do |format|
              if @reservation.save
                #@overdue.save
                @book = Book.find_by_id(@reservation.book_id) 
                @book.total_in_library = @book.total_in_library - 1
                @book.save
                format.html { redirect_to reservations_url, notice: 'Reservation was successfully created.' }
                format.json { render :show, status: :created, location: reservations_url }
              else
                format.html { render :show }
                format.json { render json: @reservation.errors, status: :unprocessable_entity }
              end
            end
  	end

  	def update
  		@reservation.update(reservation_params)
  		redirect_to reservations_url
  	end

    def overdue
      @overdue_reservations = Reservation.where('due_on < ?', Date.today)
    end

  	def destroy
      @book = Book.find_by_id(@reservation.book_id) 
      @book.total_in_library = @book.total_in_library + 1
      @book.save
  		
      @reservation.destroy
  		redirect_to reservations_url
  	end

  	def reservation_params
  		params.require(:reservation).permit(:book_id, :due_on)
      #params.require(:reservation).permit(:reserved_on, :due_on, :user_id, :book_id, :created_at, :updated_at)
  	end
  	
    before_action :set_reserved_on, only: [ :show, :edit, :update, :destroy]

  	def set_reserved_on
  	 @reservation = Reservation.find(params[:id])
  	end

  end