#!/bin/ruby

# Check that a version string is formatted correctly.
def checkVersion(version)
    /[0-9]\.[0-9]\.[0-9]\.[0-9]/ =~ version
end

# Prompt the user for a file-name, re-prompting them in invalid input.
def getVersion()
    print 'new-version> '
    version=gets()

    if checkVersion(version)
        return version
    else
        puts 'invalid input!'
        getVersion()
    end
end

# Update the version numbers in a file.
def updateVersion(file_name, new_version)
    version_section = /\sversion:\s*[0-9]\.[0-9]\.[0-9]\.[0-9]/
    text            = File.read(file_name)
    new_text        = text.gsub(version_section, " version: #{new_version}")

    # Writing new contents to file.
    File.open(file_name, "w") {|file|
        file.print new_text
    }
end

# Prompt the user for a file-name and re-prompt them if they don't input a valid file-name.
def getFileName()
    print 'file-name> '
    file_name = gets().chomp()

    if File.exist?(file_name)
        return file_name
    else
        puts 'invalid file-name'
        getFileName()
    end
end

# The main function.
def main()
    updateVersion(getFileName(), getVersion())
    puts 'VERSION UPDATED!'
end

main()
