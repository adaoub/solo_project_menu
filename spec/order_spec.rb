require "order"

describe Order do
  it "selects order items" do
    fake_item = double :fake_item
    fake_menu = double :fake_menu, add: nil
    order = Order.new("john", fake_menu, ENV["PHONE_NUM"])
    fake_menu.add(fake_item)
    order.select(fake_item, 2)
    expect(order.display).to eq [fake_item, fake_item]
  end

  it "return s total order price" do
    fake_item = double :fake_item, price: "10"
    fake_menu = double :fake_menu, add: nil
    order = Order.new("john", fake_menu, ENV["PHONE_NUM"])
    fake_menu.add(fake_item)
    order.select(fake_item, 2)
    expect(order.total_price).to eq(20)
  end

  it "returns items joined together" do
    fake_item = double :fake_item, name: "rice"
    fake_menu = double :fake_menu, add: nil
    order = Order.new("john", fake_menu, ENV["PHONE_NUM"])
    fake_menu.add(fake_item)
    order.select(fake_item, 2)
    expect(order.order_item).to eq("rice, rice")
  end

  it "returns receipt as a hash" do
    fake_item = double :fake_item, name: "rice", price: "5"
    fake_item2 = double :fake_item2, name: "pasta", price: "10"
    fake_menu = double :fake_menu, add: nil
    order = Order.new("john", fake_menu, ENV["PHONE_NUM"])
    fake_menu.add(fake_item)
    fake_menu.add(fake_item2)
    order.select(fake_item, 2)
    order.select(fake_item2, 1)
    expect(order.receipt).to eq("This is a receipt for john, {\"rice\"=>10, \"pasta\"=>10} and your grand total is 20")
  end

  it "sends a confirmation text after order" do
    fake_item = double :fake_item, name: "rice", price: "5"
    fake_menu = double :fake_menu, add: nil
    order = Order.new("john", fake_menu, ENV["PHONE_NUM"])
    fake_menu.add(fake_item)
    order.select(fake_item, 2)
    sms_text = double :sms_text
    expect(sms_text).to receive(:sms).with(hash_including(:body, :to))

    order.confirmation_text(Time.now, sms_text)
  end

  xit "returns a receipt using the receipt_output method" do
    fake_item = double :fake_item, name: "rice", price: "5"
    fake_menu = double :fake_menu, add: nil
    io = double :io
    order = Order.new("john", fake_menu, ENV["PHONE_NUM"], io)
    fake_menu.add(fake_item)
    order.select(fake_item, 1)
    expect(io).to receive(:puts).with("rice : 5")
    expect(io).to receive(:puts).with("Your total order costs £5")
    order.receipt_output
  end
end
