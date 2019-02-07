class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
		   redirect_to @user
		else
		   flash.now[:danger] =" User couldn't be created"
		   render "new"
		end
	end

	def show
		@user= User.find(params[:id])
		@upcoming_events = @user.upcoming_events(@user.invitations)
		@prev_events = @user.previous_events(@user.invitations)
		@hosting = @user.upcoming_events(@user.events)
		@hosted = @user.previous_events(@user.events)
	end

	private

	def user_params
		params.require(:user).permit(:name,:email, :password)
	end
end
