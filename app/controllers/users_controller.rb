class UsersController < ApplicationController
  def index
    @users = User.by_karma.page(params[:raoraoute].to_i)
  end
end
