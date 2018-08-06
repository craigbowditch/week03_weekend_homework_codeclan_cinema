require_relative('../db/sql_runner')

class Ticket

  attr_reader :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customer_id = options['customer_id'].to_i()
    @film_id = options['film_id'].to_i()
  end

  def save()
    sql = "INSERT INTO tickets
    (
    customer_id, film_id
     )
    VALUES ($1, $2)
    RETURNING id"
    values = [@customer_id, @film_id]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i()
  end

  def film()
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@film_id]
    result = SqlRunner.run(sql, values)
    Film.new(result[0])
  end

  def customer()
    sql = "SELECT * FROM customers Where id = $1"
    values = [@customer_id]
    result = SqlRunner.run(sql, values)
    Customer.new(result[0])
  end
  
  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    results = tickets.map { |ticket| Ticket.new(ticket)  }
    return results
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    results = SqlRunner.run(sql)
  end

  def delete_one()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql,values)
  end
end
