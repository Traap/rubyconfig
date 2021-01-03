puts "arch = #{RbConfig::CONFIG['arch']}"
puts "host =#{RbConfig::CONFIG['host']}"
puts "host_alias =#{RbConfig::CONFIG['host_alias']}"
puts "host_cpu =#{RbConfig::CONFIG['host_cpu']}"
puts "host_os =#{RbConfig::CONFIG['host_os']}"
puts "host_vendor =#{RbConfig::CONFIG['host_vendor']}"
puts "\n----------------------------------------\n"
RbConfig::CONFIG.sort.each do |key, value|
   puts "#{key} = #{value}"
end
