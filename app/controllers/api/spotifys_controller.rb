class Api::SpotifysController < ApplicationController

  def authorize
    redirect_to "https://accounts.spotify.com/authorize?client_id=#{ ENV['SPOTIFY_CLIENT_ID'] }&response_type=code&redirect_uri=http://localhost:3000/api/spotify/callback"
  end 

  def callback
    code = params[:code]

    response = Unirest.post(
                            "https://accounts.spotify.com/api/token",
                            parameters: {
                                          grant_type: "authorization_code",
                                          code: code,
                                          redirect_uri: "http://localhost:3000/api/spotify/callback",
                                          client_id: ENV['SPOTIFY_CLIENT_ID'],
                                          client_secret: ENV['SPOTIFY_CLIENT_SECRET']
                                        }
                            )

    session[:spotify_access_token] = response.body['access_token']

    redirect_to "/api/spotify/me"
  end


  def account
    response = Unirest.get("https://api.spotify.com/v1/me")
    render json: response.body
  end 


  def search
    search_terms = params[:q] 

    response = Unirest.get(
                            "https://api.spotify.com/v1/search",
                            parameters: {
                                          q: search_terms,
                                          type: 'track'
                                        }
                          )

    render json: response.body
  end


end
