def bubble_sort(array)

    i = 0
    while i < array.length
        j = 0
        swapped = false
        
        while j < array.length - i - 1
            num1 = array[j]
            num2 = array[j+1]

            if num1 > num2
                # swap num1 and num2
                array[j] = num2
                array[j+1] = num1
                swapped = true
            end

            j += 1
        end
        
        i += 1
        break if swapped == false
    end

    return array
end

p bubble_sort([4, 2, 7, 1, 3])