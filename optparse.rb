require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: emend [argv] [options]"

  opts.separator ''
  opts.separator 'Specific options:'
  opts.on('-v', '--[no-]verbose', 'Run verbosely') do |v|
    options[:verbose] = v
  end

  opts.on('-n', '--[no-]dryrun', 'No Dryrun') do |v|
    options[:dryrun] = v
  end

  opts.on('-a', '--app x,y,z', Array, 'App name') do |v|
    options[:app] = v.map! {|a|"app/#{a}/#{a}.yaml"}
  end

  opts.on('-b', '--bundle x,y,z', Array, 'Bundle name') do |v|
    options[:bundle] = v.map! {|b|"bundle/#{b}/#{b}.yaml"}
  end

  opts.on('-f', '--file x,y,z', Array, 'File name') do |v|
    options[:file] = v.map {|f|"#{f}.yaml"}
  end

  opts.on('-c', '--command-log x', 'Log commands to file name') do |v|
    options[:command_log] = v 
  end

  opts.separator ''
  opts.separator 'Print version and exit.'
  opts.on_tail('--version', 'Show version') do |v|
    options[:version] = v
  end

end.parse!

print "ARGV = #{ARGV}\n"
print "options     = #{options}\n"
print "\n-----\n\n"
print "app         = #{options[:app]}\n"
print "bundle      = #{options[:bundle]}\n"
print "command_log = #{options[:command_log]}\n"
print "dryrun      = #{options[:dryrun]}\n"
print "file        = #{options[:file]}\n"
print "verbose     = #{options[:verbose]}\n"
print "version     = #{options[:version]}\n"

# ------


