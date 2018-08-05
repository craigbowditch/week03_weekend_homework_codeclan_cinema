require_relative("../db/sql_runner")


class Customer

attr_reader :id
attr_accessor :name, :funds


  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1,$2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    results = customers.map { |customer| Customer.new(customer)  }
    return results
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    results = SqlRunner.run(sql)
  end

  def delete_one()
    sql = "DELETE FROM customers Where id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    results = SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets ON films.id = tickets.film_id
    WHERE tickets.customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map { |film| Film.new(film)  }
  end

  def decrease_funds()
    sql = "SELECT SUM(films.price) FROM films
    INNER JOIN tickets ON films.id = tickets.film_id
    WHERE tickets.customer_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first
    return @funds - result['sum'].to_i()
  end
end
