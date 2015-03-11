require './juice.rb'
class VendingMachine

  def initialize
    @sum = 0
    @stocks = {"cola"=> [], "redbull" => []}
    @available_money = [10, 50, 100, 500, 1000, 5000]
    @payback = 0
    @sales_amaunt = 0
  end

  def throwing(money)
    if @available_money.include?(money)
      @sum += money
      puts "現在#{@sum}円投入されています"
    else
      puts "#{money}円は扱えない貨幣です"
      @payback = money
    end
  end

  def payback
    puts "#{@payback}円が払い戻されます"
    @sum = 0
    @payback = 0
  end

  def stock_check?(juice_name)
    @stocks[juice_name].count > 0 ? true : false
  end

  def money_check?(juice_name)
    @sum >= @stocks[juice_name][0].price ? true : false
  end

  def stock_making(juice_name,add_num = 0)
    add_num.times {
      @stocks[juice_name].push(Juice.send(juice_name))
    }
  end

  def show_stock(juice_name = nil)
    if juice_name == nil
      @stocks.keys.count.times {|i|
        juice_name = @stocks.keys[i]
        puts "#{juice_name}の在庫は#{@stocks[juice_name].count}つあります"
      }
    else
      puts "#{juice_name}の在庫は#{@stocks[juice_name].count}つあります"
    end
  end

  def show_sales_amaount
    puts "売上は#{@sales_amaunt}円です"
  end

  def sales_management(sales)
    @sales_amaunt += sales
    @sum -= sales
  end

  def buying(juice_name)
    if stock_check?(juice_name) && money_check?(juice_name)
      @stocks[juice_name].pop
      sales = @stocks[juice_name][0].price
      puts "#{juice_name}を#{sales}円で購入しました！"
      sales_management(sales)
      @payback = @sum
    elsif !stock_check?(juice_name)
      puts "品切れです"
    else
      puts "投入金額が不足しています"
    end
  end
end

vending_machine = VendingMachine.new
vending_machine.stock_making("redbull",5)
vending_machine.stock_making("cola",5)
vending_machine.throwing(500)
vending_machine.buying("redbull")
vending_machine.show_sales_amaount
vending_machine.buying("redbull")
vending_machine.payback
vending_machine.show_stock("cola")
vending_machine.show_sales_amaount

vending_machine.throwing(1000)
vending_machine.buying("redbull")
vending_machine.buying("redbull")
vending_machine.buying("redbull")
vending_machine.buying("redbull")
vending_machine.buying("redbull")
vending_machine.buying("redbull")
