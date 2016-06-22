# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Periodicity.create(name: 'Semanal')
Periodicity.create(name: 'Quinzenal')
Periodicity.create(name: 'Mensal')
Periodicity.create(name: 'Bimestral')
Periodicity.create(name: 'Trimestral')

Category.create(name: 'Anime', image_url: '/images/categorias/anime.png')
Category.create(name: 'Biografia', image_url: '/images/categorias/biografia.png')
Category.create(name: 'Fantasia', image_url: '/images/categorias/fantasia.png')
Category.create(name: 'Infantil', image_url: '/images/categorias/infantil.png')
Category.create(name: 'Juvenil', image_url: '/images/categorias/juvenil.png')
Category.create(name: 'Estrangeiro', image_url: '/images/categorias/literatura_estrangeira.png')
Category.create(name: 'Nacional', image_url: '/images/categorias/literatura_nacional.png')
Category.create(name: 'Poesia', image_url: '/images/categorias/poesia.png')
Category.create(name: 'Policial', image_url: '/images/categorias/policial.png')
Category.create(name: 'Romantico', image_url: '/images/categorias/romantico.png')
Category.create(name: 'Terror', image_url: '/images/categorias/terror.png')

u = User.create!(id: 1, password: 'admin123', password_confirmation: 'admin123', name: 'Admin', email: 'admin@admin.com',
            telephone: '123456789', cpf: '12345678900', birth_date: Time.now, admin: true, gender: 0)

u.addresses.create(user_id: u.id, city: 'Sao Paulo', country: 'Brasil', zipcode: '05508010', state: 'SP', main: true,
               street: 'Av. Prof. Luciano Gualberto, 380', quarter: 'Jardim Paulista')