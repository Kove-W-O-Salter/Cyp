#!/bin/ruby

# Recursively, get the files of each subdirectory of `dir_path`.
def files(dir_path)
    dir = Dir.open(dir_path)
    files_ = Array.new

    dir.each do |entry|
        qualified_name = dir_path + "/" + entry

        unless (entry == ".") or (entry == "..")
            case File.ftype(qualified_name)
            when "directory"

                # Collect the files of the subdirectory.
                files_.concat(files(qualified_name))
            when "file"

                # Add the current file to the `files_`.
                files_.push(qualified_name)
            end
        end
    end

    return files_
end

def main()
    src_files = files('src')
    cmd_ln_files = ""

    puts("Generating documentation for:")

    for src_file in src_files
        puts("  + #{src_file}")

        # Adding the current filename to Haddocks command line files.
        cmd_ln_files += src_file + " "
    end

    # Adding an extra newline.
    puts('')

    puts("##### HADDOCK BEGINS #####")
    print("\e[32m")

    # Generating documentation in `docs/` with Haddock.
    puts(`haddock -o docs/ --html --use-unicode #{cmd_ln_files}`)

    print("\e[0m")
    puts("##### HADDOCK ENDS #####")
end

main()
