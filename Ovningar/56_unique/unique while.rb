def contains(array, value)
    i = 0
    while i < array.length
        if element == value
            return true
        end
        i += 1
    end

    return false
end

def unique(array)
    unique_array = []

    i = 0
    while i < array.length
        if not contains(unique_array, element)
            unique_array << element
        end
        i += 1
    end

    return unique_array
end