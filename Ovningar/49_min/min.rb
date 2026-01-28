def min(array)
    smallest_num = array[0]
    
    array.each do |num| 
        if num < smallest_num
            smallest_num = num
        end
    end
    
    return smallest_num
end