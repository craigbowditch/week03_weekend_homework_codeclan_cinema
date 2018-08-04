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

film1 = Film.new(
  {
    'title' => "The Royal Tenenbaums",
    'price' => 10
    })
    film1.save()

ticket1 = Ticket.new(
  {
    'customer_id' => customer1.id,
    'film_id' => film1.id
    })
    ticket1.save()

    binding.pry
    nil
