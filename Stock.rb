# Return a pair of days representing the best day to buy and the best day to sell.

def stock_picker(stock_price)
    size = stock_price.length
    best_buy = 0
    best_sale = 0
    best_profit = 0

    (0...size-1).each do |i|
        ((i+1)...size).each do |j|
            profit = stock_price[j] - stock_price[i]
            if best_profit <= profit
                best_profit = profit
                best_buy = i
                best_sale = j
            end
        end
    end

    puts "[Best Buy Date, Best Sell Date]: [#{best_buy}, #{best_sale}]"
end

stock_picker([17,3,6,9,15,8,6,1,10])