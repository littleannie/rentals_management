class Api::V1::ListingsController < Api::V1::BaseController
  before_action :set_listing, only: %i[show update delete]

  def index
    @listings = Listing.all
    render json: @listings
  end

  def show
    render json: @listing
  end

  def create
    @listing = Listing.new(params_listing)
    render json: @listing
  end

  def update
    @listing = Listing.update(params_listing)
    render json: @listing
  end

  def destroy
    @listing.destroy
  end

private

def set_listing
  @listing = Listing.find(params[:id])
end

def params_listing
  params.require(:listing).permit(:num_rooms)
end
end
