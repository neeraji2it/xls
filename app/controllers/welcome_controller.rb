class WelcomeController < ApplicationController
  def index
  	@trainer= Trainer.new
  end


  def signup
	@trainers= Trainer.all
   end
   
end
