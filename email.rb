require "mail"

module Email

  class CheckMail
    def shared_items_mail(username, passwd, ip)
      begin
        Mail.defaults do
          puts "#{username}"
          retriever_method :pop3, :address => "192.168.10.91",
                           :port => 110,
                           :user_name => "#{username}",
                           :password => "#{passwd}",
                           :enable_ssl => false
          file= Array.new

          mail = Mail.last
          file=mail.body.decoded
          File.open("email.txt", "w") { |the_file| the_file.puts("#{file}") }

          arr = Array.new
          path = Array.new
          test = Array.new
          line_num=0
          j=0

          File.open("email.txt").each do |line|
            arr<<line
            line_num += 1


            line_num.times do |i|
              #if arr[i] =~ /http:\/\/atraiv8\/sync\/r\?/
              #if arr[i] =~ /http:\/\/192.168.10.195\/sync\/r\?/
              if arr[i] =~ /http:\/\/#{ip}\/sync\/r\?/
                #if arr[i] =~ /http:\/\/192.168.10.252:8080\/sync\/r\?/
                #if arr[i] =~ /http:\/\/192.168.10.253:8080\/sync\/r\?/
                #if arr[i] =~ /http:\/\/192.168.10.188\/sync\/r\?/
                #if arr[i] =~ /http:\/\/localhost:8080\/sync\/r\?/
                #if arr[i] =~ /http:\/\/192.168.10.201\/sync\/r\?/
                #if arr[i] =~ /http:\/\/localhost\/sync\/r\?/
              then
                path[0]=arr[i]
                path[0]=path[0].gsub("\s", "")
                path[0]=path[0].gsub("\n", '')
                #path[0]=path[0].gsub(":",'')
                #path[0]=path[0].gsub("//",'')
                #path[0]=path[0].gsub("http",'')
                path[0]=path[0].gsub("\s", "")
              end


            end

          end
          server = path[0]

          puts "#{server}"

          File.open("temp.txt", "w") { |the_file| the_file.puts("#{path[0]}") }

          File.open("temp.txt").each do |line|
            test<<line
          end
          return "#{server}"
        end

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end
  end


  class EmailAccess<CheckMail

    def get_link(server, driver, username, password, ip)
      begin
        ob=Email::CheckMail.new
        link= ob.shared_items_mail("#{username}", "#{password}", ip)
        driver.manage.window.maximize
        driver.get "#{link}"
        driver.navigate.refresh
        puts ("#{link}")
        sleep(5)

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end

    end


  end


end