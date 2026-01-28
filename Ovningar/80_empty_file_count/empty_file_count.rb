def empty_file_count(path)
    Dir.chdir(path)
    empty_files = 0

    files_and_folders = Dir.glob("*")
    i = 0
    while i < files_and_folders.length
        if File.file?(files_and_folders[i]) 
            if File.read(files_and_folders[i]) == ""
                empty_files += 1
            end
        end
        i += 1
    end

    return empty_files
end

p empty_file_count("test/files")