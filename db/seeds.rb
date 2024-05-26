# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Warehouse.find_or_create_by!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                             address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                             description: 'Galpão destinado para cargas internacionais')

Warehouse.find_or_create_by!(name: 'Rio', code: 'RIO', city: 'Rio de Janeiro', area: 1000,
                             address: 'Endereço no Rio de Janeiro, S/N', cep: '25000-000',
                             description: 'Alguma descrição')
