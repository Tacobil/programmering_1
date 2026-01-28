def frequency_counter(array)
    frequency = {}
    array.each do |value|
        if frequency.has_key?(value) == false
            frequency[value] = 1
        else
            frequency[value] += 1
        end
    end
    return frequency
end

require 'benchmark'

array = Array.new(1e7) { rand(1..10000) }

Benchmark.bm(15) do |x|
    x.report("Result:") do
        frequency_counter(array)
    end
end

