def is_sorted_descending(integers)
    
    i = 1
    while i < integers.length
        if integers[i-1] < integers[i]
            return false
        end

        i += 1
    end

    return true
end


p is_sorted_descending([9,7,5,3])    #=> true
p is_sorted_descending([100,50,25])  #=> true
p is_sorted_descending([5,5,5,5])    #=> true
p is_sorted_descending([8,6,6,4])    #=> true
p is_sorted_descending([3,5,2,1])    #=> false
p is_sorted_descending([42])         #=> true
p is_sorted_descending([])           #=> true