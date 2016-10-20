class TrainersController < ApplicationController

	def index


    @trainer= Trainer.new
    respond_to do |format|
      format.html
      format.csv { send_data @trainers.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end

  def search
   @trainers=Trainer.all.order("created_at ASC")
  	if params[:profile_type].blank? and params[:trainer_expertise].blank? and params[:trainer_geography].blank? and params[:rating].blank?
  	  @trainers = []
    else
      @trainers = Trainer.trainer_profile_type(params[:profile_type]).trainer_expertise(params[:trainer_expertise]).trainer_location(params[:trainer_geography]).trainer_rating(params[:rating])
    end

  end

  def import
	  file  = params[:file]
	  book   = Spreadsheet.open(file.path)
    sheet1 = book.worksheet 0
    sheet1.each do |row|    	
      Trainer.create(:name => row[1],:profile_type => row[2],:industry => row[3], :experience => row[4], :expertise => row[5], :geography => row[6], :rating => row[7],:references => row[8])
    end
      redirect_to trainers_url, notice: "Spreadsheet is imported."
  end

  def new
		@trainer= Trainer.new
  end

  def create
		@trainer= Trainer.new(trainer_params)
    if @trainer.save
			redirect_to trainers_path
		else
			render "new"
		end
	end

  def show
		@trainer= Trainer.find(params[:id])
	end

  def edit
		@trainer= Trainer.find(params[:id])
	end

  def update
		@trainer= Trainer.find(params[:id])
		if @trainer.update(trainer_params)
			 redirect_to trainers_path
		else
			render "edit"
		end
	end

  def destroy
		@trainer= Trainer.find(params[:id])
		@trainer.destroy
		redirect_to trainers_path
	end

private

  def trainer_params
		params.require(:trainer).permit!
	end
	
end