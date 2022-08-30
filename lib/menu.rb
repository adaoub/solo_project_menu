class Menu
  def initialize
    @dishes = []
  end

  def add(menu_item) #menu_item is an instnace od Menuitem
    @dishes << menu_item
  end

  def remove(menu_item) #menu_item is an instnace od Menuitem
    @dishes.delete(menu_item)
  end

  def display_price(menu_item)
    menu_item.price
  end

  def display
    @dishes
  end
end
