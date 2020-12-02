class UsersController < ApplicationController
  def index
    @users = User.all
    @savedrecipes = current_user.saved_recipes
  end
end
