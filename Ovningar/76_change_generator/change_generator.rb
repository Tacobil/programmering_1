VALUES = [1000, 500, 200, 100, 50, 20, 10, 5, 2, 1]
    


def change_generator(cash)
    i = 0
    change = {}

    while i < VALUES.length do
        sedel = VALUES[i]

        if sedel <= cash
            n = (cash / sedel).to_i

            if change.has_key?(sedel) == false
                change[sedel] = 0
            end
            change[sedel] += n
            cash -= sedel * n
        else
            i += 1
        end
    end

    return change
end


require 'benchmark'

tries = 10**6
Benchmark.bm(15) do |x|
    x.report("Result:") do
        tries.times {change_generator(rand(10**100..10**101))}
    end
end

