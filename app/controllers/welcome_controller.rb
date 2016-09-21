class WelcomeController < ApplicationController
  def index
  	@trainer= Trainer.new
  end
end
