module Contacts
  class ContactsUsers
    def create_new_contact(server, driver, contact_name, contact_address)
      begin
        driver.find_element(:xpath, '//a[contains(@href, "#/contacts")]').click
        sleep 2
        driver.find_element(:css, 'span.glyphicon.glyphicon-plus').click
        sleep 2
        driver.find_element(:css, 'input[name="name"]').send_keys "#{contact_name}"
        sleep 2
        driver.find_element(:css, 'input[name="email"]').send_keys "#{contact_address}"
        sleep 2
        driver.find_element(:xpath, '(//button[@type="submit"])[11]').click
      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"

      end
    end

    def edit_contact(server, driver, contact_address, new_name)
      begin
        driver.find_element(:xpath, '//a[contains(@href, "#/contacts")]').click
        sleep 2
        driver.find_element(:xpath, "//span[contains(..,'#{contact_address}')]").click
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Edit")]').click
        sleep 2
        driver.find_element(:css, 'input[name="name"]').clear
        sleep 2
        driver.find_element(:css, 'input[name="name"]').send_keys "#{new_name}"
        sleep 2
        driver.find_element(:xpath, '(//button[@type="submit"])[9]').click
        sleep 2

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def delete_contact(server, driver, contact_address)
      begin
        driver.find_element(:xpath, '//a[contains(@href, "#/contacts")]').click
        sleep 2
        driver.find_element(:xpath, "//span[contains(..,'#{contact_address}')]").click
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Delete")]').click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[8]').click
        sleep 2

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