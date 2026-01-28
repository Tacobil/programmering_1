def insertion_sort(array)
    sorted_array = []
    
    while array.length > 0
        num = array.delete_at(0)

        i = 0
        while i < sorted_array.length
            if sorted_array[i] > num
                sorted_array.insert(i, num)
                break
            end
            i += 1
        end

        if i == sorted_array.length
            sorted_array << num
        end
    end
    return sorted_array
end