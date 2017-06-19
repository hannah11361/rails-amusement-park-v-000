class RidesController < ApplicationController
  def new
    @ride = Ride.create(:user_id => params[:user_id],
      :attraction_id => params[:attraction_id])
      @notice = @ride.take_ride
      redirect_to user_path(@ride.user), notice: @notice
  end
end
