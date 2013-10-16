class Dashboard::BaseController < ApplicationController
  protect_from_forgery
  layout 'dashboard'
end
