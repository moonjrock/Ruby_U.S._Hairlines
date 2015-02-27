require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("begin with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you the stylist name") do
      stylist = Stylist.new({:name => "Kimberly Smith", :id => nil})
      expect(stylist.name()).to(eq("Kimberly Smith"))
    end
  end

  describe("#id") do
    it("sets its ID when you save the stylist") do
      stylist = Stylist.new({:name => "Kimberly Smith", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save stylists in the database") do
      stylist = Stylist.new({:name => "Kimberly Smith", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end


  describe("#==") do
    it("is the same stylist if it matches that name") do
      stylist1 = Stylist.new({:name => "Kimberly Smith", :id => nil})
      stylist2 = Stylist.new({:name => "Kimberly Smith", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find") do
    it("returns an stylist by its ID number") do
      test_stylist = Stylist.new({:name => "Kimberly Smith", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Gina Han", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Kimberly Smith", :id => nil})
      test_stylist.save()
      test_client = Client.new({:name => "Stephanie Choi", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:name => "Sarah Moon", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  describe("#update") do
    it("lets you update stylists in the database") do
      stylist = Stylist.new({:name => "Kimberly Smith", :id => nil})
      stylist.save()
      stylist.update({:name => "Gina Han"})
      expect(stylist.name()).to(eq("Gina Han"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "Kimberly Smith", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "Gina Han", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end

    it("deletes a stylist's clients from the database") do
      stylist = Stylist.new({:name => "Kimberly Smith", :id => nil})
      stylist.save()
      client = Client.new({:name => "Stephanie Choi", :stylist_id => stylist.id()})
      client.save()
      client2 = Client.new({:name => "Sarah Moon", :stylist_id => stylist.id()})
      client2.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end
end
