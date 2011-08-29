#!/usr/bin/ruby
require 'rubygems'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:EVAL_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:PROMPT_MODE] = :SIMPLE

%w[pp wirble hirb interactive_editor view_source].each do |gem|
  begin
    require gem
  rescue LoadError => e
    print e
  end
end




Wirble.init
Wirble.colorize
Hirb::View.enable

# IRB.conf[:AUTO_INDENT] = true

class Object

  # def source_for_method(method)
  #   location = self.method(method).source_location
  #   `mate #{location[0]} -l #{location[1]}` if location
  #   location
  # end
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
  
  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def copy_history
  history = Readline::HISTORY.entries
  index = history.rindex("exit") || -1
  content = history[(index+1)..-2].join("\n")
  puts content
  copy content
end

def paste
  `pbpaste`
end

begin
  require "ap"
  #IRB::Irb.class_eval do
    #def output_value
      #ap @context.last_value
    #end
  #end
rescue LoadError => e
  puts "ap gem not found.  Try typing 'gem install awesome_print' to get super-fancy output."
end

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']




# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  #IRB.conf[:USE_READLINE] = true

  # Display the RAILS ENV in the prompt
  # ie : [Development]>> 
  IRB.conf[:PROMPT][:CUSTOM] = {
        :PROMPT_N => "[#{ENV["RAILS_ENV"].capitalize}]>> ",
        :PROMPT_I => "[#{ENV["RAILS_ENV"].capitalize}]>> ",
        :PROMPT_S => nil,
        :PROMPT_C => "?> ",
        :RETURN => "=> %s\n"
  }
  # Set default prompt
  IRB.conf[:PROMPT_MODE] = :CUSTOM
end
