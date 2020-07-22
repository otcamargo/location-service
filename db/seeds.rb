# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vulnerable_zone = Location.create(
    cep: '01311-922',
    logradouro: 'Avenida Paulista 1195',
    bairro: 'Bela Vista',
    localidade: 'São Paulo',
    uf: 'SP'
)
