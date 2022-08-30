require "menu"

require "menu_item"

RSpec.describe "integration" do
  it "return an empty list of menu items" do
    menu_item = MenuItem.new("name", "10")
    menu = Menu.new()
    expect(menu.display).to eq []
  end

  it "adds a menu item to dishes array" do
    menu_item = MenuItem.new("name", "10")
    menu = Menu.new()
    menu.add(menu_item)
    expect(menu.display).to eq [menu_item]
  end

  it "deletes a menu item from dishes array" do
    menu_item = MenuItem.new("name", "10")
    menu = Menu.new()
    menu.add(menu_item)
    menu.remove(menu_item)
    expect(menu.display).to eq []
  end
  it "return price" do
    menu_item = MenuItem.new("name", "10")
    menu = Menu.new()
    expect(menu.display_price(menu_item)).to eq "10"
  end
end
