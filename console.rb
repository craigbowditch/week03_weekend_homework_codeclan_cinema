require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')
require_relative('db/sql_runner')
require ('pry')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new(
  {
    'name' => "Craig",
    'funds' => 500
    })
    customer1.save()

customer2 = Customer.new(
  {
    'name' => "John",
    'funds' => 50
    })
    customer2.save()

film1 = Film.new(
  {
    'title' => "The Royal Tenenbaums",
    'price' => 10
    })
    film1.save()

film2 = Film.new(
  {
    'title' => "The Big Lebowski",
    'price' => 8
    })
    film2.save()

ticket1 = Ticket.new(
  {
    'customer_id' => customer1.id,
    'film_id' => film1.id
    })
    ticket1.save()

ticket2 = Ticket.new(
  {
    'customer_id' => customer1.id,
    'film_id' => film2.id
    })
    ticket2.save()

ticket3 = Ticket.new(
  {
    'customer_id' => customer2.id,
    'film_id' => film1.id
    })
    ticket3.save()
        
    binding.pry
    nil
