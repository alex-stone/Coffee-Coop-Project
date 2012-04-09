namespace :dev do
  task :init_db => :environment do
    desc "Initializes development database with sample data"
    
    producer1 = User.create!(:name => 'Adelaida Martinez Gutierrez', :email => 'adelaida@coffee.com')
    producer1.role = 'producer'
    producer1.save!

    producer2 = User.create!(:name => 'Anselmo Valle', :email => 'anselmo@coffee.com')
    producer2.role = 'producer'
    producer2.save!
    
    producer3 = User.create!(:name => 'Antonio Gomez', :email => 'antoniogomez@coffee.com')
    producer3.role = 'producer'
    producer3.save!
    
    producer4 = User.create!(:name => 'Catalino Castillo Ballecillo', :email => 'catcastball@coffee.com')
    producer4.role = 'producer'
    producer4.save!

  end
end
