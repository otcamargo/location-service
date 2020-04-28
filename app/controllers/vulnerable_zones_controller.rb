class VulnerableZonesController < ApplicationController
  def index
    vulnerable_zones = VulnerableZone.all
    render json: vulnerable_zones
  end

  def create
    zip_code = params[:cep]
    uri = "https://viacep.com.br/ws/#{zip_code}/json/"
    response = HTTParty.get(uri)

    vulnerable_zone_params = {
      cep: response.parsed_response["cep"],
      logradouro: response.parsed_response["logradouro"],
      bairro: response.parsed_response["bairro"],
      localidade: response.parsed_response["localidade"],
      uf: response.parsed_response["uf"]
    }

    VulnerableZone.create!(vulnerable_zone_params)

    render json: response
  end

  def destroy
    zip_code = format_zip_code(params[:cep])

    @vulnerable_zone = VulnerableZone.find_by!(cep: zip_code)
    @vulnerable_zone.destroy!

    render head: :ok
  end

  private

  def format_zip_code(zip_code)
    if zip_code.length == 8
      return zip_code.insert(5, "-")
    else
      return zip_code
    end
  end
end
