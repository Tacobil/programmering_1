def exclude(array, value)
    new_array = []
    array.each do |element| 
        if element != value
            new_array << element
        end
    end

    return new_array
end