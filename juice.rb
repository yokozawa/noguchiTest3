class Juice
  attr_accessor :name, :price, :ml

  def initialize(name, price, ml)
    @name = name
    @price = price
    @ml = ml
  end

  def self.cola
    self.new("cola", 120, 350)
  end

  def self.redbull
    self.new("redbull", 200, 350)
  end

end
