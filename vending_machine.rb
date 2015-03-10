require './juice.rb'
require './sales.rb'
class VendingMachine

  def initialize
    @sum = 0
    @stocks = {"cola"=> [], "redbull" => []}
    @ng_money = [1, 5, 2000, 5000, 10000]
  end

  def throwing(money)
    if @ng_money.include?(money)
      puts "#{money}円は扱えない貨幣です"
    else
      @sum += money
      puts "現在#{@sum}円投入されています"
    end
  end

  def payback(sales)
    @sum -= sales
    puts "#{@sum}円が払い戻されます"
  end

  def stock_check(juice_name)
    @stocks[juice_name].count > 0 ? true : false
  end

  def money_check(juice_name)
    @sum >= @stocks[juice_name][0].price ? true : false
  end

  def stock_making(juice_name,add_num = 0)
    add_num.times {
      @stocks[juice_name].push(Juice.send(juice_name))
    }
  end

  def show_stock(juice_name)
    puts "在庫は#{@stocks[juice_name].count}つあります"
  end

  def buying(juice_name)
    if stock_check(juice_name) && money_check(juice_name)
      @stocks[juice_name].pop
      sales = @stocks[juice_name][0].price
      Sales.new(sales).getsum(sales)
      puts "#{juice_name}を#{sales}円で購入しました！"
      a = payback(sales)
    elsif money_check(juice_name)
      puts "品切れです"
    else
      puts "投入金額が不足しています"
    end
  end
end

vending_machine = VendingMachine.new
vending_machine.stock_making("cola",5)
vending_machine.show_stock("cola")
vending_machine.stock_making("cola",3)
vending_machine.show_stock("cola")
vending_machine.throwing(120)
vending_machine.buying("cola")
vending_machine.show_stock("cola")
