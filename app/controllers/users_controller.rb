class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  def create
    @user = User.new(user_params)
    if @user.save
    auth_token = AuthenticateUser.new(@user.email, @user.password).call
    response = { message: Message.account_created, auth_token: auth_token}
    json_response(response, :created)
    else
      response = @user.errors.full_messages
       response = @user.errors.full_messages.join(";")
      render json: { status: 500, errors: response}
    end
  end

  private

  def user_params
    params.permit(
      :username,
      :email,
      :password,
      :password_confirmation,
    )
  end
end
