require "menu_item"

describe MenuItem do
  it "returns name and price" do
    menu_item = MenuItem.new("rice", "£7.99")
    expect(menu_item.name).to eq "rice"
    expect(menu_item.price).to eq "£7.99"
  end
end
