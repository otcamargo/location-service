class ZipCodesController < ApplicationController
  def index
    zip_codes = Location.all
    render json: zip_codes
  end

  def create
    zip_code = params[:zip_code]
    uri = "https://viacep.com.br/ws/#{zip_code}/json/"
    response = HTTParty.get(uri)

    zip_code_params = {
      zip_code: response.parsed_response["cep"],
      street: response.parsed_response["logradouro"],
      neighborhood: response.parsed_response["bairro"],
      city: response.parsed_response["localidade"],
      state: response.parsed_response["uf"]
    }

    Location.create!(zip_code_params)

    render json: response
  end

  def destroy
    zip_code = format_zip_code(params[:zip_code])
  
    @zip_code = Location.find_by!(zip_code: zip_code)
    @zip_code.destroy!

    render head: :ok
  end

  private

  def format_zip_code(zip_code)
    if zip_code.length == 8
      return zip_code.insert(5, "-")
    else
      puts "Invalid"
    end
  end
end
