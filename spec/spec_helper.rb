require("rspec")
require("pg")
require("stylist")
require("client")

DB = PG.connect({:dbname => "test_database"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylist *;")
  end
end
