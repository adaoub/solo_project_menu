require "twilio-ruby"
require "dotenv/load"

class Order
  def initialize(name, menu, phone_num) #menu is an instance of Menu, name is a string of customer name
    @name = name
    @phone_num = phone_num
    @menu = menu
    @order = []
  end

  def name
    @name
  end

  def select(item, quantity)
    quantity.times do
      @order << item
    end
  end

  def total_price
    sum = 0
    # @order.reduce(0) { |sum, menu_item| sum + menu_item.price.to_f }
    @order.each do |menu_item|
      total = menu_item.price.to_i
      sum += total
    end
    return sum
  end

  def order_item
    food = []
    @order.each do |menu_item|
      food << menu_item.name
    end
    food.join (", ")
  end

  def receipt
    item_receipt = {}
    @order.each do |menu_item|
      if !item_receipt[menu_item.name]
        item_receipt[menu_item.name] = menu_item.price.to_i
      else
        item_receipt[menu_item.name] += menu_item.price.to_i
      end
    end
    return "This is a receipt for #{@name}, #{item_receipt} and your grand total is #{total_price}"
  end

  def display
    @order
  end

  def confirmation_text(time, send_sms)
    order_time_arrival = time + (30 * 60)
    message = "Thank you! Your order was placed and will be delivered before #{order_time_arrival}"
    send_sms.sms(to: @phone_num, body: message)
  end
end
