def count(array, value)
    frequency = 0

    array.each do |element| 
        if element == value
            frequency += 1
        end
    end

    return frequency
end