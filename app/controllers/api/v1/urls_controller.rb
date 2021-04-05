class Api::V1::UrlsController < ApplicationController
  
  def index
    urls = Url.all
    render json: urls, status: 200
  end

  def create
    url = Url.new(
      long_url: url_params[:long_url],
      short_url: "This is a short URL"
    )
    if url.save
      # For the time, we are showing the db record to the user
      # TO DO: render json: url.short_url, status: 200
      render json: url, status: 200
    else
      render json: {error: "Error shortening the url."}
    end
  end

  def show
    url = Url.find_by_short_url(params[:short_url])
    if url
      redirect_to url.long_url
    else
      render json: {error: "Url Not Found."}
    end
  end

  private
    def url_params
      params.require(:url).permit(:long_url)
    end
end
