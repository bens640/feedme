class MessagesController < ApplicationController
    before_action :set_post, except: :create
\
    def create

      @message = Message.new message_params
      @message.reservation_id = params[:reservation_id]
      if current_user
        @message.user_id = current_user.id
      else
        @message.chef_id = current_chef.id
      end

      if @message.save
        respond_to do |format|
          format.html { redirect_to :back }
          format.js
        end
      else
        flash[:alert] = "Check the message form, something went wrong."
        render root_path
      end
    end




    def destroy
      @message = @reservation.messages.find(params[:id])

      @message.destroy
      flash[:success] = "message deleted :("
      redirect_to root_path
    end

    private
    def message_params
      params.
          require(:message).
          permit(:subject, :message, :reservation)
    end

    def set_post
      @reservation = Reservation.find(params[:reservation_id])
    end
  end




