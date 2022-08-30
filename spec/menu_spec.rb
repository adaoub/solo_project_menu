require "menu"

describe Menu do
  it "adds an item to the menu" do
    menu = Menu.new
    fake_item = double :fake_item
    menu.add(fake_item)
    expect(menu.display).to eq [fake_item]
  end

  it "removes an item from the menu" do
    menu = Menu.new
    fake_item = double :fake_item
    menu.add(fake_item)
    fake_item2 = double :fake_item2
    menu.add(fake_item2)
    menu.remove(fake_item)
    expect(menu.display).to eq [fake_item2]
  end
end
