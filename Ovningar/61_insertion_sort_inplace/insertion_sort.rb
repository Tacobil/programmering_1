def insertion_sort(array)
    array.each_with_index do |num, i|
        j = i
        while j > 0
            if array[j-1] > num
                array[j-1], array[j] = array[j], array[j-1]
            else
                break
            end

            j -= 1
        end
    end
    return array
end

p insertion_sort([5,4,6,8,1])