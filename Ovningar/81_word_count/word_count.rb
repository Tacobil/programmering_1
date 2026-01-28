def word_count(file)
    count = 0

    text = File.read(file)

    count += text.split(" ").length

    return count
end

p word_count("test/files/fil1.txt")