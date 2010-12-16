class ApplicationController < ActionController::Base
  before_filter :authenticate_user!

  protect_from_forgery
  GENDER = [['male','Male'],['female','Female']]
end
