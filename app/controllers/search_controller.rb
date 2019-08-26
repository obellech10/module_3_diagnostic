class SearchController < ApplicationController
  def index
    render locals: {
      facade: AltFuelStationsFacade.new(params[:q])
    }
  end
end
