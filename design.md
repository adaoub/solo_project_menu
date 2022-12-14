# {{Menu_project}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

> As a customer
> So that I can check if I want to order something
> I would like to see a list of dishes with prices.

> As a customer
> So that I can order the meal I want
> I would like to be able to select some number of several available dishes.

> As a customer
> So that I can verify that my order is correct
> I would like to see an itemised receipt with a grand total.

> As a customer
> So that I am reassured that my order will be delivered on time
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
Menu class to see a list of dishes (methods: display, add, remove)
MenuItem Class to add dishes to menu (methods: name, price)
Order class to allow customer to select dishes from menu as well as to view order details (methods: select, name, total_price, display)



```

_Also design the interface of each class in more detail._

```ruby
class Menu
  def initialize ()
    #.....
  end

  def add (menu_item)#menu_item is an instnace od Menuitem
  end

  def remove (menu_item)#menu_item is an instnace od Menuitem
  end

  def display 
  # returns the menu items
  end
end

class MenuItem
  def iniialize(name, price) #both name and price are strings
  #....
  end

  def name
  #returns name as string
  end

  def price
  #returns price as strinf
  end
end

class Order
  def initialize(name, menu) #menu is an instance of Menu, name is a string of customer name
  #.....
  end

  def name
  #returns name
  end

  def total_price
  #return total price
  end

  def display 
  #return order object
  end

  def receipt
  #return an itemised receipt with total price
  eend
  
  def select(item, qunatity)  #item is the menu_item instance  and quanity is number of dishes wanted

  #adds order to an array
  end
end







```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE
  
    menu_item1 = MenuItem.new("rice", "??5.99")
    order = Order.new("john", menu = Menu.new, ENV["PHONE_NUM"])
    menu.add(menu_item1) 
    order.select(menu_item1, 1)
    order.display #=> [menu_item1, menu_item2]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE
    fake_item = double :fake_item
    fake_menu = double :fake_menu, add: nil
    order = Order.new("john", fake_menu, ENV["PHONE_NUM"])
    fake_menu.add(fake_item)
    order.select(fake_item, 2)
    order.display #=> [fake_item, fake_item]

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
