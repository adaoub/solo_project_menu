require "order"

describe Order do
  it "selects order items" do
    fake_item = double :fake_item
    fake_menu = double :fake_menu, add: nil
    order = Order.new("john", fake_menu)
    fake_menu.add(fake_item)
    order.select(fake_item, 2)
    expect(order.display).to eq [fake_item, fake_item]
  end

  it "return s total order price" do
    fake_item = double :fake_item, price: "10"
    fake_menu = double :fake_menu, add: nil
    order = Order.new("john", fake_menu)
    fake_menu.add(fake_item)
    order.select(fake_item, 2)
    expect(order.total_price).to eq(20)
  end

  it "returns items joined together" do
    fake_item = double :fake_item, name: "rice"
    fake_menu = double :fake_menu, add: nil
    order = Order.new("john", fake_menu)
    fake_menu.add(fake_item)
    order.select(fake_item, 2)
    expect(order.order_item).to eq("rice, rice")
  end

  it "returns receipt" do
    fake_item = double :fake_item, name: "rice", price: "5"
    fake_item2 = double :fake_item2, name: "pasta", price: "10"
    fake_menu = double :fake_menu, add: nil
    order = Order.new("john", fake_menu)
    fake_menu.add(fake_item)
    fake_menu.add(fake_item2)
    order.select(fake_item, 2)
    order.select(fake_item2, 1)
    expect(order.receipt).to eq("This is a receipt for john, {\"rice\"=>10, \"pasta\"=>10} and your grand total is 20")
  end
end
