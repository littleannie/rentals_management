class Api::V1::ListinfsController < Api::V1::BaseController
  def index
    @listings = Listing.all
  end
end
