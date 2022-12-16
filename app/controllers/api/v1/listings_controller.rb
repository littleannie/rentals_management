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
    if @listing.save
      render json: @listing
    else
      render json: { error: 'Unable to create listing' }, status: 400
    end
  end

  def update
    if @listing.update(params_listing)
      render json: @listing
    else
      render json: { error: 'Unable to update listing' }, status: 400
    end
  end

  def destroy
    if @listing.destroy
      render json: { error: 'Successfully deleted' }, status: 200
    else
      render json: { error: 'Unable to destroy listing' }, status: 400
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def params_listing
    params.require(:listing).permit(:num_rooms)
  end
end
