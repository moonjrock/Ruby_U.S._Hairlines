require("spec_helper")

describe(Client) do
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

describe("#save") do
  it("adds a client to the array of saved clients") do
    test_client = Client.new({:description => "Available Client", :id => 1})
    test_client.save()
    expect(Client.all()).to(eq([test_client]))
    end
  end

describe("#description") do
  it("lets you read the description out") do
    test_client = Client.new({:description => "Available Client", :id => 1})
    expect(test_client.description()).to(eq("Available Client"))
    end
  end

describe("#id") do
  it("lets you read the client ID") do
    test_client = Client.new({:description => "Available Client", :id => 1})
      expect(test_client.id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same client if it has the same description and client ID") do
      client1 = Client.new({:description => "Available Client", :id => 1})
      client2 = Client.new({:description => "Available Client", :id => 1})
      expect(client1).to(eq(client2))
    end
  end
end
