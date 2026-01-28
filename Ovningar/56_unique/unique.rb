def contains(array, value)
    array.each do |element|
        if element == value
            return true
        end
    end

    return false
end

def unique(array)
    unique_array = []

    array.each do |element|
        if not contains(unique_array, element)
            unique_array << element
        end
        
    end
    return unique_array
end