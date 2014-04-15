class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :change, :only => [:edit, :update, :destroy]
  before_action :signedin, :only => [:edit, :update, :destroy, :create]

  def new
  	@picture = Picture.new(:competition_id => params[:competition_id])
  end

  def show
  	 
  end

  def voteresults
      @pictures = Picture.all
  end

  def index
  	@pictures = Picture.all
  end

  def upvote
    @picture = Picture.find(params[:id])
    @picture.votes.create
    render text: @picture.votes.count
  end

  def create
      @picture = Picture.new(picture_params)
      @picture.user = current_user

       if @picture.save
         redirect_to @picture.competition, notice: 'Picture was successfully created.'   
       else
         render "new" 
       end
   end

   def edit
    
   end

    def update
      if @picture.update(picture_params)
        redirect_to @picture, notice: 'Picture was successfully updated.' 
      else
        render action: 'edit' 
      end
  end

  def destroy
    if @picture.present?
      @picture.destroy
    end
    redirect_to root_url
  end

  private

    def set_picture
      @picture=Picture.find(params[:id])
    end

    def  picture_params
    	params.require(:picture).permit(:title, :description,  :image, :image_cache, :competition_id)
    end

    def change
      unless current_user == @picture.user
        redirect_to @picture, notice: 'U bent niet gemachtigd'
      end
    end
    
    def signedin
      unless signed_in?
        redirect_to :back, notice: 'U bent niet gemachtigd'
      end
    end
end