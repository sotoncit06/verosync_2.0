require 'io/console'

def run_selenium
  shell_output = ""
  IO.popen('cmd', 'r+') do |pipe|
    # pipe.puts("java -jar C://selenium-server-standalone-2.44.0.jar")
    pipe.puts("java -jar C://selenium-server-standalone-2.53.1.jar")
    pipe.close_write
    shell_output = pipe.read
  end
end

#Run Selenium Server
run_selenium