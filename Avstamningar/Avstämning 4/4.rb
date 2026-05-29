def filter_below_threshold(hash, threshold)
    result = {}
    hash.keys.each do |key|
        value = hash[key]

        if value < threshold
            result[key] = value
        end
    end

    return result
end


temperatures = {"Stockholm" => 5, "Göteborg" => 8, "Malmö" => 12}
p filter_below_threshold(temperatures, 10) #=> {"Stockholm" => 5, "Göteborg" => 8}

stock = {"apples" => 50, "bananas" => 3, "oranges" => 12}
p filter_below_threshold(stock, 15) #=> {"bananas" => 3, "oranges" => 12}

points = {"x" => 100, "y" => 200, "z" => 300}
p filter_below_threshold(points, 100) #=> {}

empty_hash = {}
p filter_below_threshold(empty_hash, 10) #=> {}