class Account::BaseController < ApplicationController
  before_action :authenticate_user!
  layout "account"
end
