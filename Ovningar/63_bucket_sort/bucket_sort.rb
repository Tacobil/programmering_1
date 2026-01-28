
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

def bucket_sort(array)
    buckets = []

    max = array.max
    n = array.length

    # insert numbers into their buckets
    array.each_with_index do |num, i|
        normalized = num / (max + 1)
        bucket_index = (n * normalized).to_i

        # create bucket if bucket doesn't exist
        if not buckets[bucket_index]
            buckets[bucket_index] = []
        end
        
        buckets[bucket_index] << num
    end

    # insertion sort all buckets
    sorted_buckets = []
    buckets.each do |bucket|
        sorted_buckets << insertion_sort(bucket)
    end

    result = []
    sorted_buckets.each do |bucket|
        result += bucket
    end
    return result
end

input_array = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]


p bucket_sort(input_array)