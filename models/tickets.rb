require_relative("../db/sql_runner")
require_relative("customers.rb")
require_relative("films.rb")
require_relative("movies.rb")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :movie_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @film_id = options['film_id']
    @movie_id = options['movie_id']

  end

  def save()
    sql = "INSERT INTO tickets
    (
      customer_id,
      film_id,
      movie_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@customer_id, @film_id, @movie_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new(ticket) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end


end
