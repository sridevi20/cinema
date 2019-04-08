require_relative("../db/sql_runner")
require_relative("tickets.rb")
require_relative("films.rb")
require_relative("movies.rb")

class Customer

    attr_reader :id
    attr_accessor :name, :funds, :total

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @funds = options['funds'].to_i
        @total = options['total'].to_i
    end

    def save()
        sql = "INSERT INTO customers
        (
         name,funds,
         total
         )
         VALUES
         (
          $1, $2, $3
          )
          RETURNING id"
        values = [@name, @funds, @total]
        customers = SqlRunner.run(sql, values).first
        @id = customers['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM customers"
      values = []
      customers = SqlRunner.run(sql, values)
      result = customers.map { |customer| Customer.new( customer ) }
      return result
    end


    def self.delete_all()
      sql = "DELETE FROM customers"
      values = []
      SqlRunner.run(sql, values)
    end
    def update()
      sql = "UPDATE customers SET(name, funds, total) = ($1, $2, $3) WHERE id = $4"
      values = [@name, @funds, @total, @id]
      SqlRunner.run(sql, values)
    end

    def film()
      sql = "SELECT films.* FROM films INNER JOIN
      tickets ON films.id = tickets.film_id
      WHERE tickets.customer_id = $1"
      values = [@id]
      films = SqlRunner.run(sql, values)
      return films.map{|film| Film.new(film)}
    end

    def film_price(price)
      @funds -= price
    end

    def buy_ticket()
      result = film()
      result.each{|film| film_price(film.price)}
      update()
    end

    def ticket()
      sql = "SELECT * FROM tickets INNER JOIN
      customers ON customer_id = customers.id;"
      values = [@id]
      result = SqlRunner.run(sql, values)
      return result.map {|ticket| Ticket.new(ticket)}
    end

    def count_tickets(customer_id)
      #for customer in customers
        if (customers.id = customer_id)
          return customer.id+= @total

         end
      end
    #end


      def total_tickets()
        result = ticket()
        result.each{|ticket| count_tickets(ticket.customer_id)}
      end
end
