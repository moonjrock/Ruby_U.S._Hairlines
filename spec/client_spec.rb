require('spec_helper')

describe(Client) do
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:name => "Stephanie Choi", :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#name") do
    it("lets you read the name out") do
      test_client = Client.new({:name => "Stephanie Choi", :stylist_id => 1})
      expect(test_client.name()).to(eq("Stephanie Choi"))
    end
  end

  describe("#stylist_id") do
    it("lets you read the list ID out") do
      test_client = Client.new({:name => "Stephanie Choi", :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same client if it has the same name") do
      client1 = Client.new({:name => "Stephanie Choi", :stylist_id => 1})
      client2 = Client.new({:name => "Stephanie Choi", :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end
end
