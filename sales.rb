class Sales
  attr_accessor :sum
  @@sum_total = 0

  def initialize(sum)
    @sum = sum
  end
  def getsum(sales)
    @@sum_total += sales
  end
end
