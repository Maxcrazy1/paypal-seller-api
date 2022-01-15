class Api::V1::UserController < ApplicationController

  def update
    if @user
      @user.update(params.permit(:email))
      @response = @user
    end

    render json: { message: 'User was updated successfully' }
  end
end
