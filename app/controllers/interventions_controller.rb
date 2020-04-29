class InterventionsController < ApplicationController
  protect_from_forgery
  before_action :set_intervention, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize_admins_and_employees, only: :index

  def authorize_admins_and_employees
    redirect_to index_path, status: 401 unless current_user.role.id <= 2
    # puts "Current user role is #{current_user.role.id}"
  end

  def index
    @interventions = Intervention.all
    @intervention = Intervention.new
    @user = current_user
    # puts "The current user is #{current_user.username} with role #{current_user.role.id}"

    if params[:customer].present?
      @buildings = Customer.find(params[:customer]).buildings
      # puts "Loading specific buildings."
    else
      @buildings = Customer.all
      # puts "Loading all buildings."
    end

    if params[:building].present?
      @batteries = Building.find(params[:building]).batteries
      # puts "Loading specific batteries."
    else
      @batteries = Building.all
      # puts "Loading all batteries."
    end

    if params[:battery].present?
      @columns = Battery.find(params[:battery]).columns
      # puts "Loading specific columns."
    else
      @columns = Battery.all
      # puts "Loading all columns."
    end

    if params[:column].present?
      @elevators = Column.find(params[:column]).elevators
      # puts "Loading specific elevators."
    else
      @elevators = Column.all
      # puts "Loading all elevators."
    end

    if request.xhr?
      respond_to do |format|
        format.json {
          render json: {
            buildings: @buildings,
            batteries: @batteries,
            columns: @columns,
            elevators: @elevators
          }
        }
      end
    end
  end

  def create
    require 'zendesk_api'
    @intervention = Intervention.new(intervention_params)
    @user = current_user

    @intervention.author = current_user.id
    puts @intervention.author

    company = @intervention.customer_id
    @customer = Customer.find(company)

    client = ZendeskAPI::Client.new do |config|
      config.url = ENV["ZENDESK_URL"]
      config.username = ENV["ZENDESK_USERNAME"]
      config.password = ENV["ZENDESK_PASSWORD"]
      config.retry = true
      config.raise_error_when_rate_limited = false
      require 'logger'
      config.logger = Logger.new(STDOUT)
    end  

    # ZendeskAPI::Ticket.create!(client, :type => ["problem", "question"].sample, :subject => "New intervention request from #{current_user.username}", :comment => { :value => "An intervention request has been opened by #{current_user.username}. The details are as follow : \n\n **The requester** : #{current_user.username} \n**The Customer (Company Name)** : #{@customer.company_name} \n**Building ID** : #{@intervention.building_id} \n**The Battery ID** : #{@intervention.battery_id} \n**The Column ID if specified** : #{@intervention.column_id} \n**Elevator ID if specified** : #{@intervention.elevator_id} \n**The employee to be assigned to the task** : #{@intervention.employee_id} \n**Description of the request for intervention** : #{@intervention.report}"}, :submitter_id => client.current_user.id, :priority => "urgent")

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to @intervention, notice: 'Intervention was successfully created.' }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: 'Intervention was successfully updated.' }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to interventions_url, notice: 'Intervention was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    def intervention_params
      params.require(:intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_date, :end_date, :result, :report, :status)
    end
end
