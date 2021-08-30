class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActiveResponse::Controller
  include LinkedRails::Controller
  include LinkedRails::Auth::AuthHelper
end
