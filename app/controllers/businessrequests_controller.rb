class BusinessrequestsController < ApplicationController
  before_action :set_businessrequest, only: [:show, :edit, :update, :destroy]
  before_action :signedin, :only => [:edit, :update, :destroy, :create]

  # GET /businessrequests
  # GET /businessrequests.json
  def index
    @businessrequests = Businessrequest.all
  end

  # GET /businessrequests/1
  # GET /businessrequests/1.json
  def show
  end

  # GET /businessrequests/new
  def new
    @businessrequest = Businessrequest.new
  end

  # GET /businessrequests/1/edit
  def edit
  end

  # POST /businessrequests
  # POST /businessrequests.json
  def create
    @businessrequest = Businessrequest.new(businessrequest_params)
    @businessrequest.user = current_user 
    if @businessrequest.save
      redirect_to @businessrequest, notice: 'Businessrequest was successfully created.' 
    else
      render action: 'new' 
    end
  end

  # PATCH/PUT /businessrequests/1
  # PATCH/PUT /businessrequests/1.json
  def update
    if @businessrequest.update(businessrequest_params)
      redirect_to @businessrequest, notice: 'Businessrequest was successfully updated.' 
    else
      render action: 'edit' 
    end
  end

  # DELETE /businessrequests/1
  # DELETE /businessrequests/1.json
  def destroy
    @businessrequest.destroy
    redirect_to businessrequests_url 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_businessrequest
      @businessrequest = Businessrequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def businessrequest_params
      params.require(:businessrequest).permit(:kvk, :company, :phone, :request)
    end

    def signedin
      unless signed_in?
        redirect_to :back, notice: 'U bent niet gemachtigd'
      end
    end
end
