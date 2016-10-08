class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception




def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:email,:role, :first_name, :last_name, :username, :gender_type_list, :name, :address, :city, :phone, :date_of_birth,:password, :student, :password_confirmation)
  end
end
