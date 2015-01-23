require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  @stylist = Stylist.all()
  erb(:index)
end

post("/clients") do
  description = params.fetch("description")
  stylist_id = params.fetch("stylist_id").to_i()
  task = Client.new({:description => description, :stylist_id => stylist_id})
  task.save()
  @list = Stylist.find(stylist_id)
  erb(:stylist)
end

post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylists/:id") do
  @stylist = stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end
