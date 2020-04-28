class PeopleController < ApplicationController
  def index
    people = Person.all
    render json: people
  end

  def create
      uri = "https://viacep.com.br/ws/#{params[:cep]}/json/"
      response = HTTParty.get(uri)

      person_params = {
        nome: params[:nome],
        email: params[:email],
        cep: params[:cep],
        logradouro: response.parsed_response["logradouro"],
        bairro: response.parsed_response["bairro"],
        localidade: response.parsed_response["localidade"],
        uf: response.parsed_response["uf"]
      }

      Person.create!(person_params)

      render json: response
  end

  def destroy
    email = params[:email]
  
    @person = Person.find_by!(email: email)
    debugger
    @person.destroy!

    render head: :ok
  end
end
