def file_count(path)
    Dir.chdir(path) # go to path directory
    files = 0

    files_and_folders = Dir.glob("*") # get all files and folders
    i = 0
    while i < files_and_folders.length
        if File.file?(files_and_folders[i])
            files += 1
        end
        i += 1
    end

    return files
end

p file_count("test/files")