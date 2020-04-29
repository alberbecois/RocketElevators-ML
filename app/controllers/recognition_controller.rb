class RecognitionController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!
  before_action :authorize_admins_and_employees, only: :index

  def authorize_admins_and_employees
    redirect_to index_path, status: 401 unless current_user.role.id <= 2
    # puts "Current user role is #{current_user.role.id}"
  end
end
