class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  
  # TODO: uncomment before_action :authenticate_user! and remove this
  def current_user
    User.new
  end
end
