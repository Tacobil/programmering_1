def quick_sort(array)
    pivot_i = array.length - 1 
    pivot = array[pivot_i]

    if array.length < 2
        return pivot
    end

    left_section = []
    right_section = []

    array.each_with_index do |num, i|
        if i == pivot_i
            next
        end

        if num < pivot
            left_section << num
        else
            right_section << num
        end
    end

    if left_section.length > 1
        left_section = quick_sort(left_section)
    end
    if right_section.length > 1
        right_section = quick_sort(right_section)
    end

    return left_section + [pivot] + right_section
end

p quick_sort([5,8,1,2,3,2,2,5,7])