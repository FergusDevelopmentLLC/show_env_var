https://www.youtube.com/watch?v=gXgjPEB2j2Y
https://www.rubyguides.com/2019/01/ruby-environment-variables/
https://rubygems.org/
https://medium.com/@theorynest/creating-a-cli-ruby-gem-1dbf0990652b
https://tomdebruijn.com/posts/gems-on-the-command-line/
https://coderwall.com/p/fa_v8a/make-your-own-gem
https://gist.github.com/ahcode0919/9cd476c8ce7bccb5eafae679f5754267
https://www.sitepoint.com/creating-your-first-gem/

1. $ bundle gem show_env_var, this creates the gem scaffold
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
9. $ export HIKING_PROJECT_KEY=XXX
10. change /lib/show_env_var.rb

```
require_relative './show_env_var/version'
require 'net/http'
require 'json'
require 'pry'
require 'open-uri'
require 'nokogiri'

module ShowEnvVar
  class Show 

    def show_environment_var
      puts "make sure to set the HIKING_PROJECT_KEY"
      puts "$ export HIKING_PROJECT_KEY=xxx"
      puts "this is the hiking project key: #{ENV["HIKING_PROJECT_KEY"]}"
    end

    def show_nokogiri
      url = "https://www.hikingproject.com/data/get-trails?lat=39.7609154&lon=-105.0440525&maxDistance=10&key=#{ENV["HIKING_PROJECT_KEY"]}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      raw_trails = JSON.parse(response)
      puts raw_trails
    end

  end
end
```
11. Create the executable in bin folder (show_env_var), no rb extention
```
#!/usr/bin/env ruby
require 'show_env_var'

s = ShowEnvVar::Show.new
s.show_environment_var
s.show_nokogiri
```
12. chmod +x ./bin/show_env_var
13. Make sure the executable works:
```
    $ ./bin/show_env_var
    this is the environment var: 123
    XXX result from nokogiri
    -->
```
14. Change spec.bindir in show_env_var.gemspec
```
spec.bindir        = "bin"
```
15. change spec.executables
```
spec.executables   = "show_env_var"
```
16. 
```
$ rake install
```
this will create the gem in pkg folder

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
```
bundle install
```
21.
```
$ show_env_var
```