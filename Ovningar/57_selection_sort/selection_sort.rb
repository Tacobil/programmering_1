# done
def selection_sort(array)
    sorted_array = []

    while array.length > 0 # sort until array is empty
        
        smallest_i = 0
        smallest_num = array[smallest_i]
        # find smallest number
        array.each_with_index do |num, i|
            if num < smallest_num
                smallest_i = i
                smallest_num = num
            end
        end
        # add smallest number to new array and remove it from the old one
        sorted_array << smallest_num
        array.delete_at(smallest_i)
    end

    return sorted_array
end
