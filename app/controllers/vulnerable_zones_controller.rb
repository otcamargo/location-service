class VulnerableZonesController < ApplicationController
  def index
    vulnerable_zones = VulnerableZone.all
    render json: vulnerable_zones
  end 
end
