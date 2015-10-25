require './lib/menu'

class Order

  attr_reader :basket, :menu, :total

  def initialize(menu_klass= Menu)
    @menu_klass = menu_klass
    @menu = @menu_klass.new
    @basket = Hash.new(0)
    @total = 0
  end

  def add_order(name, quantity)
    @basket[name] += quantity
    basket.each {|dish, qty| "you have added #{dish} x #{qty} in your basket"}
    @basket
  end

  def basket_sum
    raise 'Basket is empty' if basket.empty?
    message = ""
    @basket.each {|item, qty| message = message + "#{item} x #{qty} = £#{(menu.dish[item]*qty)}"}
    message
  end

  def total_sum
    @basket.map {|item, qty| @total += menu.dish[item] * qty}
    "Your total is: #{total}"
  end

end
