require_relative('models/customer.rb')
require_relative('db/sql_runner')
require ('pry')


Customer.delete_all()

customer1 = Customer.new(
  {
    'name' => "Craig",
    'funds' => 500
    })
    customer1.save()


    binding.pry
    nil
