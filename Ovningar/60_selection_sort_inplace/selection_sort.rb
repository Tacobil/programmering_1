def selection_sort(array)
    i = 0
    while i < array.length # sort until array is empty

        j = i
        smallest_i = j
        smallest_num = array[j]

        # find smallest number in array
        while j < array.length
            if array[j] < smallest_num
                smallest_i = j
                smallest_num = array[j]
            end

            j += 1
        end

        # put the smallest number in the sorted part of the array
        array[smallest_i] = array[i]
        array[i] = smallest_num

        i += 1
    end

    return array
end

p selection_sort([5,5,7,1,2,])