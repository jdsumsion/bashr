require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize

require 'irb/completion'
IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE

# the stuff below gives me access to the bash cmdline from within irb
require 'fileutils'
include FileUtils

require 'set'
module BashR
  def method_missing(method, *args)
    if exe?(method.to_s)
      system([method, args].flatten.join(" "))
    else
      super.method_missing(method, args)
    end
  end

  def exe?(cmd)
    @@known_executables ||= Set.new
    @@known_executables.include?(cmd) ||
      system("which #{cmd} > /dev/null") &&
      @@known_executables.add(cmd)
  end
end
include BashR

