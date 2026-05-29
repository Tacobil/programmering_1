def count_ending_with(strings, character)
    count = 0

    strings.each do |str|
        if str[-1] == character
            count += 1
        end
    end

    return  count
end

files = ["image.png", "document.pdf", "photo.png", "notes.txt", "icon.png"]
p count_ending_with(files, "g") #=> 3
p count_ending_with(files, "f") #=> 1
p count_ending_with(files, "t") #=> 1
p count_ending_with(files, "x") #=> 0