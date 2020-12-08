class UsersController < ApplicationController
  after_create :send_welcome_email

  def index
    @users = User.all
    @savedrecipes = current_user.saved_recipes
  
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
