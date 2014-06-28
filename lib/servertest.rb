def mounted?(device)
  result = false
  mountsfile = File.open('/proc/mounts')
  mountsfile.each_line do |line|
    if line.start_with? device
      result = true
      break
    end
  end
  mountsfile.close

  report "#{device} has been mounted?", result
end

class Reporter
  def get_binding
    binding
  end

  def report(message, result)
    puts "#{message}: #{result}"
  end
end

class CLIReporter < Reporter
  def report(message, result)
    puts "#{message} [#{result}]"
  end
end
