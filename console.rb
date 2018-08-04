require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('db/sql_runner')
require ('pry')


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

    binding.pry
    nil
