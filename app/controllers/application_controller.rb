class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_headers

  def set_headers
    if session[:spotify_access_token]
      @spotify_access_token = session[:spotify_access_token]
      Unirest.default_header("Authorization", "Bearer #{session[:spotify_access_token]}")
    else
      Unirest.clear_default_headers()
    end
  end
end
