#!/bin/ruby

def git_clone(author, repo)
    puts(' ~~~ BEGIN GIT ~~~')
    system("git clone https://github.com/#{author}/#{repo}")
    puts(' ~~~ END GIT ~~~')
end

def main()
    current_install_dir = Dir.pwd()
    Dir.chdir("/tmp")
    git_clone("Kove-W-O-Salter", "Cyp")
    puts("Run the following commands to continue the update:")
    puts("cp -r /tmp/Cyp #{current_install_dir} && cd #{current_install_dir} && sudo rm -r /tmp/Cyp")
end

main()
