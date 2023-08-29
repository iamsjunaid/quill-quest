class UsersController < ApplicationController
  def index
    @users = User.all.order(id: :asc)
  end

  def show; end
end
