https://www.youtube.com/watch?v=gXgjPEB2j2Y
https://www.rubyguides.com/2019/01/ruby-environment-variables/
https://rubygems.org/
https://medium.com/@theorynest/creating-a-cli-ruby-gem-1dbf0990652b
https://tomdebruijn.com/posts/gems-on-the-command-line/
https://coderwall.com/p/fa_v8a/make-your-own-gem
https://gist.github.com/ahcode0919/9cd476c8ce7bccb5eafae679f5754267
https://www.sitepoint.com/creating-your-first-gem/

1. $ bundle gem show_env_var
2. make CHANGELOG.md file in root
3. create repo on github: https://github.com/FergusDevelopmentLLC/show_env_var
4. $ git add --all
5. $ git commit -m "initial commit"
6. $ git remote add origin git@github.com:FergusDevelopmentLLC/show_env_var.git
7. $ git push -u origin master
8. Add freeze to version number
```
module ShowEnvVar
  VERSION = "0.1.0".freeze
end
```
9. $ export WILLS_ENV_VAR=123
10. change /lib/show_env_var.rb

```
require_relative './show_env_var/version'
module ShowEnvVar
  class Show 
    def show_environment_var
      puts "this is the environment var: #{ENV["WILLS_ENV_VAR"]}"
    end
  end
end
```
11. Create the executable in bin folder (show_env_var), no rb extention
```
#!/usr/bin/env ruby
require 'show_env_var'

ShowEnvVar::Show.new.show_environment_var
```
12. chmod +x ./bin/show_env_var
13. Make sure the executable works:
```
    $ ./bin/show_env_var
    this is the environment var: 123
    -->
```
14. $ rake install
    this will create the gem in pkg folder
15. Change spec.bindir in show_env_var.gemspec
```
spec.bindir        = "bin"
```
16. change spec.executables
```
spec.executables   = "show_env_var"
```
17. make sure show_env_var is uninstalled
```
$ gem uninstall show_env_var
```
18. Move to pkg dir
cd pkg
19. $ gem install show_env_var
```
Successfully installed show_env_var-0.1.0
Parsing documentation for show_env_var-0.1.0
Installing ri documentation for show_env_var-0.1.0
Done installing documentation for show_env_var after 0 seconds
1 gem installed
```
20. 