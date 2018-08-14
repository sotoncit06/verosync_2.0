module Trash
  class TrashOperations
    def file_delete(server, driver)
      begin
        driver.find_element(:xpath, '//a[contains(@href, "#/trash")]').click
        sleep 2
        driver.find_element(:css, 'th > input[type="checkbox"]').click
        sleep 2
        driver.find_element(:css, 'td.fm-table-name-col').click
        sleep 2
        driver.find_element(:xpath, '(//a[contains(text(),"Permanently Delete")])[3]').click
        sleep 2
        driver.find_element(:xpath, '//body[@id="ng-app"]/div[3]/div/div/div[2]/button[2]').click

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def file_restore(server, driver)
      begin
        driver.find_element(:xpath, '//a[contains(@href, "#/trash")]').click
        sleep 2
        driver.find_element(:css, 'th > input[type="checkbox"]').click
        sleep 2
        driver.find_element(:css, 'td.fm-table-name-col').click
        sleep 2
        driver.find_element(:css, '#contextMenuMultiSelect > li > a.ng-binding').click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[8]').click
      end
    end

    def clean_trash(server, driver)
      driver.find_element(:xpath, '//a[contains(@href, "#/trash")]').click
      sleep 2
      driver.find_element(:xpath, '//body[@id="ng-app"]/div/div[5]/div[2]/div/div/button').click
      sleep 2
      driver.find_element(:id, 'actionbar-empty-trash').click
      sleep 2
      driver.find_element(:xpath,'//body[@id="ng-app"]/div[3]/div/div/div[3]/button[2]').click
    end

    def delete_all_from_home(server, driver)
      driver.find_element(:css,'input[type="checkbox"]').click
      sleep 2
      driver.find_element(:css,'td.fm-table-name-col').click
      sleep 2
      driver.find_element(:xpath,"(//a[contains(text(),'Delete')])[4]").click
      sleep 2
      driver.find_element(:xpath, '(//button[@type="button"])[62]').click
    end

    def search_in_home(server,driver,file_name) # search file or folder in Home
      begin
        file_name=file_name.to_s
        driver.find_element(:link,file_name)
        p 'File exists'
      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.file_not_found
        puts e.message
      end
    end


  end
end