class Client
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      description = client.fetch("description")
      stylist_id = client.fetch("stylist_id").to_i()
      client.push(Client.new({:description => description, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (description, stylist_id) VALUES ('#{@description}', #{@stylist_id});")
  end

  define_method(:==) do |another_client|
    self.description().==(another_client.description()).&(self.stylist_id().==(another_stylist.id()))
  end
end
