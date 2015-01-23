require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("begin with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("lets you save Stylist in the database") do
      stylist = Stylist.new({:name => "Stylist", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#id") do
    it("sets its ID when you save the stylist") do
      stylist = Stylist.new({:name => "Stylist", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same stylist if it matches that name") do
      client1 = Stylist.new({:name => "Stylist", :id => nil})
      track2 = Stylist.new({:name => "Stylist", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find") do
    it("returns an stylist by its ID number") do
      test_stylist = Stylist.new({:name => "Kim", :id => nil})
      test_stylist.save()
      test_stylistt2 = Stylist.new({:name => "Gina", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end
end
