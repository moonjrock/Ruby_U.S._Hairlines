require('spec_helper')

# DB = PG.connect({:dbname => 'test_database'})
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM stylist *;")
#   end
# end

describe(Client) do
  describe(".all") do
    it("begin with no clients") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("lets you save clients in the database") do
      client = Client.new({:name => "Client", :id => nil})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end


  describe("#id") do
    it("sets its ID when you save the client") do
      client = Client.new({:name => "Client", :id => nil})
      client.save()
      expect(client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same client if it matches that name") do
      client1 = Client.new({:name => "Client", :id => nil})
      track2 = Client.new({:name => "Client", :id => nil})
      expect(client1).to(eq(client2))
    end
  end

  # describe(".find") do
  #   it("returns an expense by its ID number") do
  #     test_track = Tracker.new({:name => "Burger stuff", :id => nil})
  #     test_track.save()
  #     test_track2 = Tracker.new({:name => "Pizza stuff", :id => nil})
  #     test_track2.save()
  #     expect(Tracker.find(test_track2.id())).to(eq(test_track2))
  #   end
  # end
end
