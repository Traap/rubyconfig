# {{{ Real ruby code

require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: array [argv] [options]"

  opts.separator ''
  opts.separator 'Specific options:'

  opts.on('-a', '--app x,y,z', Array, 'App name') do |v|
    options[:app] = v.map! {|a|"app/#{a}/#{a}.yaml"}
  end

  opts.on('-b', '--bundle x,y,z', Array, 'Bundle name') do |v|
    options[:bundle] = v.map! {|b|"bundle/#{b}/#{b}.yaml"} end

  opts.on('-f', '--file x,y,z', Array, 'File name') do |v|
    options[:file] = v.map! {|f|"#{f}.yaml"}
  end

  opts.on('-c', '--command-log x', 'Log commands to file name') do |v|
    options[:command_log] = v
  end


end.parse!

# -------------------------------------------------------------------------- }}}
# {{{ Concatenate all file names into a single hash entry. 

files = []
files.concat( options[:app] )      unless options[:app].nil?
files.concat( options[:bundle] )   unless options[:bundle].nil?
files.concat( options[:file] )     unless options[:file].nil?
options[:files] = files

# -------------------------------------------------------------------------- }}}
# {{{ Hackers test code....


puts "ARGV #{ARGV}"
puts "options #{options}"
puts "command_log #{options[:command_log]}"
puts "options[:app] #{options[:app]}"
puts "options[:bundle] #{options[:bundle]}"
puts "options[:file] #{options[:file]}"
puts ""
puts "options[:files] #{options[:files]}"
puts ""

# -------------------------------------------------------------------------- }}}
# {{{ Put ruby command in "r register.
#
# Test #1 - Using vim only.
#
#           r!ruby array.rb test1 -c commands.log -a x,y,z -b a,b,c -f j,k,l
#           r!ruby array.rb test2 -c commands.log -a x,y,z -b a,b,c
#           r!ruby array.rb test3 -c commands.log -a x,y,z
#
#           :<c-r>r<cr>
#
# Test #2 - Repeat test #1 using a tmux-runner
#           1) <leader>or - open runner
#           2) <leader>sc - clear && ruby array.rb -f a,b,c -c commands.log
#
# Test #3 - Navigate between vim splits and tmux panes with <c-h,j,k,l>
#           1) <c-l><c-b><shift>" tmux verticle split
#           2) <c-j><c-k> up / down within tmux panes
#           3) <c-h> back to vim
#           4) :h d
#           5) <c-k> back to vim buffer with array.rb
#           6) :76,$d - delete test ouput
#           7) 76G
#
# -------------------------------------------------------------------------- }}}
#


