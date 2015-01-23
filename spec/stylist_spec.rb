require("spec_helper")

describe(Stylist) do
  describe(".all") do
    it("is empty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end

describe("#save") do
  it("adds a stylist to the array of saved stylists") do
    test_stylist = Stylist.new({:description => "Available Stylist", :id => 1})
    test_stylist.save()
    expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

describe("#description") do
  it("lets you read the description out") do
    test_stylist = Stylists.new({:description => "Available Stylist", :id => 1})
    expect(test_stylist.description()).to(eq("Available Stylist"))
    end
  end

describe("#id") do
  it("lets you read the stylist ID") do
    test_stylist = Stylist.new({:description => "Available Stylist", :id => 1})
      expect(test_stylist.id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same description and stylist ID") do
      stylist1 = Stylist.new({:description => "Available Stylist", :id => 1})
      stylist2 = Stylist.new({:description => "Available Stylist", :id => 1})
      expect(stylist1).to(eq(stylist2))
    end
  end
end
