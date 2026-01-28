def contains(array, value)
    i = 0
    while i < array.length
        element = array[i]
        
        if element == value
            return true
        end

        i += 1
    end

    return false
end

