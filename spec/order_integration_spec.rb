require "order"
require "menu"
require "menu_item"
require "verify_order"

describe "integartio" do
  it "returns the selected menu items by the customer" do
    menu_item1 = MenuItem.new("rice", "£5.99")
    menu_item2 = MenuItem.new("fries", "£3.99")
    menu_item3 = MenuItem.new("pasta", "£8.99")
    # menu = Menu.new
    order = Order.new("john", menu = Menu.new)
    menu.add(menu_item1)
    menu.add(menu_item2)
    menu.add(menu_item3)
    order.select(menu_item1, 1)
    order.select(menu_item2, 1)
    expect(order.display).to eq [menu_item1, menu_item2]
  end

  it " can order mutiple quantities of the same dish" do
    menu_item1 = MenuItem.new("rice", "£5.99")
    order = Order.new("john", menu = Menu.new)
    menu.add(menu_item1)
    order.select(menu_item1, 3)
    expect(order.display).to eq [menu_item1, menu_item1, menu_item1]
  end

  it "returns total price" do
    menu_item1 = MenuItem.new("rice", "5")
    order = Order.new("john", menu = Menu.new)

    menu.add(menu_item1)
    order.select(menu_item1, 20)
    expect(order.total_price).to eq 100
  end

  it "returns order items joined" do
    menu_item1 = MenuItem.new("rice", "5")
    order = Order.new("john", menu = Menu.new)

    menu.add(menu_item1)
    order.select(menu_item1, 2)
    expect(order.order_item).to eq ("rice, rice")
  end

  it "returns itematised receipt" do
    menu_item1 = MenuItem.new("rice", "5")
    menu_item2 = MenuItem.new("pasta", "10")
    order = Order.new("john", menu = Menu.new)
    menu.add(menu_item1)
    menu.add(menu_item2)
    order.select(menu_item1, 2)
    order.select(menu_item2, 1)
    expect(order.receipt).to eq ("{\"rice\"=>10, \"pasta\"=>10} and your grand total is 20")
  end
end
