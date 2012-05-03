namespace :dev do
  task :init_db => :environment do
    desc "Initializes development database with sample data"
    
    producer1 = User.create!(:name => 'Adelaida Martinez Gutierrez', :email => 'adelaida@coffee.com', :center_id => 1)
    producer1.role = 'producer'
    producer1.save!

    producer2 = User.create!(:name => 'Anselmo Valle', :email => 'anselmo@coffee.com', :center_id => 1)
    producer2.role = 'producer'
    producer2.save!
    
    producer3 = User.create!(:name => 'Antonio Gomez', :email => 'antoniogomez@coffee.com', :center_id => 2)
    producer3.role = 'producer'
    producer3.save!
    
    producer4 = User.create!(:name => 'Catalino Castillo Ballecillo', :email => 'catcastball@coffee.com', :center_id => 3)
    producer4.role = 'producer'
    producer4.save!

  end

  task :centers_init_db => :environment do
    desc "Initializes Center data"
    center1 = Center.create!(:name => 'COMPROCOOM')
    center2 = Center.create!(:name => 'San Jose de los Auctions')
    center3 = Center.create!(:name => 'Rancho Grande')
    center4 = Center.create!(:name => 'Wibuse')
    center5 = Center.create!(:name => 'The Chocolata')
  end
end
