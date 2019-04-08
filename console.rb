require_relative('models/tickets')
require_relative('models/films')
require_relative('models/customers')
require_relative('models/movies')

require( 'pry-byebug' )

#Customer.delete_all()
# Film.delete_all()
# Ticket.delete_all()

customer1 = Customer.new({ 'name' => 'Mary',
                          'funds' => 100,
                          'total' =>  @total })

customer2 = Customer.new({ 'name' => 'Abby',
                           'funds' => 200,
                           'total' =>  @total })

customer3 = Customer.new({ 'name' => 'Kathy',
                           'funds'=> 300,
                           'total' => @total })

customer4 = Customer.new({ 'name' => 'Cara',
                            'funds'=> 400,
                            'total' => @total})



customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer1.update()

film1 = Film.new({'title' => 'Iron Lady',
                  'price' => 10 })


film2 = Film.new({'title' => 'Mission Impossible',
                    'price' => 15 })


film3 = Film.new({'title' => 'Avengers',
                    'price' => 20 })


film1.save()
film2.save()
film3.save()

movie1 = Movie.new({'year' => '2014',
                     'show_time' => '10:00'})
movie2 = Movie.new({'year' => '2015',
                     'show_time' =>  '13:00'})
movie3 = Movie.new({'year' => '2018',
                     'show_time' =>  '15:00'})
movie1.save()
movie2.save()
movie3.save()

ticket1 = Ticket.new({'customer_id'  => customer1.id,
                      'film_id'  => film1.id,
                       'movie_id' => movie1.id })
ticket2 = Ticket.new({'customer_id'  => customer1.id,
                      'film_id'  => film2.id,
                       'movie_id' => movie2.id })
ticket3 = Ticket.new({'customer_id'  => customer2.id,
                      'film_id'  => film2.id,
                       'movie_id' => movie2.id })
ticket4 = Ticket.new({'customer_id'  => customer2.id,
                      'film_id'  => film3.id,
                       'movie_id' => movie3.id })

ticket5 = Ticket.new({'customer_id'  => customer3.id,
                      'film_id'  => film1.id,
                       'movie_id' => movie1.id })

ticket6 = Ticket.new({'customer_id'  => customer3.id,
                       'film_id'  => film3.id,
                       'movie_id' => movie3.id })

ticket7 = Ticket.new({'customer_id'  => customer4.id,
                      'film_id'  => film1.id,
                       'movie_id' => movie1.id })


 ticket1.save()
 ticket2.save()
 ticket3.save()
 ticket4.save()
 ticket5.save()
 ticket6.save()
 ticket7.save()


binding.pry
nil
