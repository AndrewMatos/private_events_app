class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
		@user = User.find_by(id: session[:user_id])
		@event= @user.events.build(event_params)

		if @event.save

			 if params[:event][:users_invited]
        		invited = params[:event][:users_invited].split(",")
            	create_invitation(invited)
             end
			redirect_to @user
        else
        	render "new"
		end
	end

	def show
		@event= Event.find_by(id: params[:id])
	end

	def index
        @passed_events = Event.past
        @upcoming_events =Event.upcoming
	end

	private

	def create_invitation(invited)
		invited.each do |u|
			if invited_user = User.find_by(name: u)
				#debugger
			   AttendEvent.create(user_id: invited_user.id, event_id: @event.id)
			end
        end
	end

	def event_params
        params.require(:event).permit(:name, :description, :location, :time)
	end
end
