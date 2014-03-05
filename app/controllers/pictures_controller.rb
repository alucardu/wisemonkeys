class PicturesController < ApplicationController
  def new
  	@picture = Picture.new
  end

  def show
  	 @picture = Picture.find(params[:id])
  end

  def index
  	@pictures = Picture.all
  end

  def create
       @picture = Picture.new(picture_params)

      respond_to do |format|
       if @picture.save
          format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
          format.json { render action: 'index', status: :created, location: @picture }
       else
          render "new"
       end
     end
   end

   def edit

   end

    def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

private

  def  picture_params
  	params.require(:picture).permit(:title, :description,  :image)
  end
end