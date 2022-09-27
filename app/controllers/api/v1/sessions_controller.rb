class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      render status: 200, json: UsersSerializer.new(user)
    else
      render status: 400
    end
  end 
end 