def max(array)
    largest_num = array[0]

    array.each do |num|
        if num > largest_num
            largest_num = num
        end
    end

    return largest_num
end