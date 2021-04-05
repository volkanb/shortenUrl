class UrlsController < ApplicationController
  before_action :set_url, only: %i[ show ]

  # GET /urls/1 or /urls/1.json
  def show
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # POST /urls or /urls.json
  def create

    shortened_url = Url.find_by_short_url(url_params[:long_url])
    if shortened_url
      redirect_to shortened_url.long_url
    else
      existing_url = Url.find_by_long_url(url_params[:long_url])
      if existing_url
        respond_to do |format|
          format.html { redirect_to existing_url, notice: "This url has already been shortened." }
          format.json { render :show, status: :found, location: existing_url }
        end
      else
        @url = Url.new(url_params)
        respond_to do |format|
          if @url.save
            format.html { redirect_to @url, notice: "Url was successfully shortened." }
            format.json { render :show, status: :created, location: @url }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @url.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def url_params
      params.require(:url).permit(:long_url)
    end
end
