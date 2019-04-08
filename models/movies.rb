require_relative("../db/sql_runner")
require_relative("tickets.rb")
require_relative("films.rb")
require_relative("customers.rb")

class Movie

    attr_reader :id
    attr_accessor :year, :show_time

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @year = options['year'].to_i
        @show_time = options['show_time'].to_i
    end

    def save()
        sql = "INSERT INTO movies
        (
         year, show_time
        )
         VALUES
         (
          $1, $2
         )
          RETURNING id"
        values = [@year, @show_time]
        result = SqlRunner.run( sql, values).first
        @id = result['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM movies"
      values = []
      movies = SqlRunner.run(sql, values)
      result = movies.map { |movie| Movie.new( movie ) }
      return result
    end


    def self.delete_all()
      sql = "DELETE FROM movies"
      values = []
      SqlRunner.run(sql, values)
    end

    def update()
      sql = "UPDATE movies SET(year, showtime) = ($1, $2) WHERE id = $3"
      values = [@year, @show_time, @id]
      SqlRunner.run(sql, values)
    end
  end
