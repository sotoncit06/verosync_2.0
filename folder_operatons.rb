module FolderOperations

  class FolderOperationsDetails

    def folder_creation(server, driver, folder_name)
      begin
        #driver.find_element(:css, '#logo-img').click
        #driver.find_element(:xpath,'//a[2]/span').click
        driver.find_element(:css, 'span.glyphicon.glyphicon-plus').click
        sleep (2)
        driver.find_element(:xpath, '//input[@id="folder-name" and @class="form-control input-sm ng-pristine ng-invalid ng-invalid-required" and @name="name"]').send_keys("#{folder_name}")
        #driver.find_element(:xpath,'//div[@id="newFolder"]/div/div/div/form/fieldset/div[2]/div/textarea').send_keys("#{folder_name}")
        driver.find_element(:xpath, '//div[@id="newFolder"]/div/div/div/form/fieldset/div[4]/div/button').click
        sleep (5)
      rescue Exception => e
        puts e.message
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    def folder_share(server, driver, folder_name, recipient)
      begin
        #driver.find_element(:css, '#logo-img').click
        driver.find_element(:xpath, "//a[@class='file-name']/descendant::span[text()='#{folder_name}']").click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[4]').click
        sleep (2)
        driver.find_element(:xpath, '//a[contains(text(),"Share Folder")]').click
        sleep (2)
        driver.find_element(:xpath, '(//input[@type="text"])[6]').send_keys("#{recipient},")
        sleep (2)
        driver.action.send_keys(:enter)
        driver.find_element(:xpath, '//div[@id="shareFolder"]/div/div/div/form/fieldset/div[3]/div/button').click
        sleep (5)
      rescue Exception => e
        puts e.message
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end

    def folder_share_invite(server, driver, folder_name, recipient)
      begin
        #driver.find_element(:css, '#logo-img').click
        sleep 2
        driver.find_element(:xpath, "//span[contains(..,'#{folder_name}')]").click
        sleep 2
        driver.find_element(:xpath, '//ul[@id="contextMenu"]/li[2]/a').click
        sleep 2
        driver.find_element(:css, '#add-users-btn').click
        sleep 2
        driver.find_element(:xpath, '(//input[@type="text"])[6]').send_keys("#{recipient},")
        sleep (2)
        driver.action.send_keys(:enter)
        driver.find_element(:xpath, '//div[@id="shareFolder"]/div/div/div/form/fieldset/div[4]/div/button').click
        sleep 5

      rescue Exception => e
        puts e.message
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    def folder_share_multiple_user(server, driver, folder_name, recipient_one, recipient_two)

      begin
        #driver.find_element(:css, '#logo-img').click
        driver.find_element(:xpath, "//a[@class='file-name']/descendant::span[text()='#{folder_name}']").click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[4]').click
        sleep (2)
        driver.find_element(:xpath, '//a[contains(text(),"Share Folder")]').click
        sleep (2)
        driver.find_element(:xpath, '(//input[@type="text"])[6]').send_keys("#{recipient_one},")
        sleep 2
        driver.find_element(:xpath, '(//input[@type="text"])[6]').send_keys("#{recipient_two},")
        sleep (2)
        driver.action.send_keys(:enter)
        driver.find_element(:xpath, '//div[@id="shareFolder"]/div/div/div/form/fieldset/div[3]/div/button').click
        sleep (5)
      rescue Exception => e
        puts e.message
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    def folder_sent_link_without_login(server, driver, folder_name, recipient)
      begin
        #driver.find_element(:css, '#logo-img').click
        sleep 2
        driver.find_element(:xpath, "//span[contains(..,'#{folder_name}')]").click
        sleep 2
        driver.find_element(:xpath, '//ul[@id="contextMenu"]/li[3]/a').click
        sleep 3
        driver.find_element(:xpath, "(//input[@type='text'])[5]").clear
        driver.find_element(:xpath, "(//input[@type='text'])[5]").send_keys("#{recipient},")
        sleep 2
        driver.action.send_keys(:enter)
        sleep 2
        driver.find_element(:css, 'div.checkbox.ng-binding > input.ng-pristine.ng-valid').click
        sleep 2
        driver.find_element(:xpath, "//div[@id='shareLink']/div/div/div/form/fieldset/div[4]/div/button").click
        sleep 2

      rescue Exception => e
        puts e.message
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end


    def folder_sent_link_add_file(server, driver, folder_name, recipient)
      begin
        #driver.find_element(:css, '#logo-img').click
        sleep 2
        driver.find_element(:xpath, "//span[contains(..,'#{folder_name}')]").click
        sleep 2
        driver.find_element(:xpath, '//ul[@id="contextMenu"]/li[3]/a').click
        sleep 3
        driver.find_element(:xpath, "(//input[@type='text'])[5]").clear
        driver.find_element(:xpath, "(//input[@type='text'])[5]").send_keys("#{recipient},")
        sleep 2
        driver.action.send_keys(:enter)
        #sleep 2
        #driver.find_element(:xpath, '//div[@id="shareLink"]/div/div/div/form/fieldset/div[3]/div[2]/div[2]/div/input').click
        sleep 2
        driver.find_element(:xpath, "//div[@id='shareLink']/div/div/div/form/fieldset/div[4]/div/button").click
        sleep 2
      rescue Exception => e
        puts e.message
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end


    def folder_sent_link_no_file_add(server, driver, folder_name, recipient)
      begin
        driver.find_element(:xpath, "//span[contains(..,'#{folder_name}')]").click
        sleep 2
        driver.find_element(:xpath, '//ul[@id="contextMenu"]/li[3]/a').click
        sleep 3
        driver.find_element(:xpath, "(//input[@type='text'])[5]").clear
        driver.find_element(:xpath, "(//input[@type='text'])[5]").send_keys("#{recipient},")
        sleep 2
        driver.action.send_keys(:enter)
        sleep 2
        driver.find_element(:xpath, "//div[@id='shareLink']/div/div/div/form/fieldset/div[4]/div/button").click

      rescue Exception => e
        puts e.message
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end


    def folder_history(server, driver, folder_name)
      begin
        #driver.find_element(:css, '#logo-img').click
        sleep 2
        driver.find_element(:xpath, "//a[@class='file-name']/descendant::span[text()='#{folder_name}']").click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[4]').click
        sleep (2)
        driver.find_element(:xpath, '//a[contains(text(),"History")]').click
        sleep (10)
        driver.find_element(:link, 'Home').click
        sleep (5)
      rescue Exception => e
        puts e.message
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end

    def folder_update_description(server, driver, folder_name, description)
      begin
        #driver.find_element(:css, '#logo-img').click
        sleep 2
        driver.find_element(:xpath, "//a[@class='file-name']/descendant::span[text()='#{folder_name}']").click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[4]').click
        sleep (2)
        driver.find_element(:link, 'Update Description').click
        sleep (2)
        driver.find_element(:xpath, '//div[@id="updateDescription"]/div/div/div/form/fieldset/div/div/textarea').clear
        sleep (2)
        driver.find_element(:xpath, '//div[@id="updateDescription"]/div/div/div/form/fieldset/div/div/textarea').send_keys("#{description}")
        sleep (2)
        driver.find_element(:xpath, '(//button[@type="submit"])[5]').click
        sleep (2)
      rescue Exception => e
        puts e.message
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end

    end

    def folder_rename(server, driver, folder_name, rename_folder)
      begin
        #driver.find_element(:css, '#logo-img').click
        sleep 2
        driver.find_element(:xpath, "//a[@class='file-name']/descendant::span[text()='#{folder_name}']").click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[4]').click
        sleep (2)
        driver.find_element(:link, 'Rename').click
        sleep (2)
        driver.find_element(:xpath, '//div[@id="renameItem"]/div/div/div/form/fieldset/div/div/input').clear
        sleep (2)
        driver.find_element(:xpath, '//div[@id="renameItem"]/div/div/div/form/fieldset/div/div/input').send_keys "#{rename_folder}"
        sleep (2)
        driver.find_element(:xpath, '(//button[@type="submit"])[8]').click

        sleep (2)
      rescue Exception => e
        #puts e.message
        puts "folder_rename():button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end

    def share_folder_rename(server, driver, folder_name, rename_folder)
      begin
        #driver.find_element(:css, '#logo-img').click
        sleep 2
        #driver.find_element(:xpath,"//a[@class='file-name']/descendant::span[text()='#{folder_name}']").click
        driver.find_element(:xpath, "//span[contains(..,'#{folder_name}')]").click

        # sleep 2
        # driver.find_element(:xpath, '(//button[@type="button"])[3]').click
        sleep (2)
        driver.find_element(:xpath, '//ul[@id="contextMenu"]/li[7]/a').click
        sleep (2)
        driver.find_element(:xpath, '//div[@id="renameItem"]/div/div/div/form/fieldset/div/div/input').clear
        sleep (2)
        driver.find_element(:xpath, '//div[@id="renameItem"]/div/div/div/form/fieldset/div/div/input').send_keys "#{rename_folder}"
        sleep (2)
        #driver.find_element(:xpath, '(//button[@type="submit"])[6]').click
        driver.find_element(:xpath, '(//button[@type="submit"])[4]').click

        sleep (2)
      rescue Exception => e
        #puts e.message
        puts "share_folder_rename():button not found"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        #puts "Rescue"
      end
    end

    def folder_delete(server, driver, folder_name)
      begin
        #driver.find_element(:css, '#logo-img').click
        sleep 2
        driver.find_element(:xpath, "//a[@class='file-name']/descendant::span[text()='#{folder_name}']").click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[4]').click
        sleep (2)
        #driver.find_element(:xpath, '//a[contains(text(),"Delete")]').click
        driver.find_element(:link, 'Delete').click
        sleep (2)
        #driver.find_element(:xpath, '(//button[@type="button"])[64]').click
        #driver.find_element(:xpath, '(//button[@type="button"])[61]').click
        driver.find_element(:xpath, '(//button[@type="button"])[62]').click
        sleep (2)
      rescue Exception => e
        puts e.message
        #puts "Rescue"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
      end
    end


    def folder_select(server, driver, folder_name)
      begin
        sleep 2
        driver.find_element(:xpath, "//a[@class='file-name']/descendant::span[text()='#{folder_name}']").click
        sleep (2)
      rescue Exception => e
        puts e.message
        #puts "Rescue"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
      end
    end


    def sub_folder_creation(server, driver, folder_name, folder_description)
      begin
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[4]').click
        sleep (2)
        driver.find_element(:xpath, '//a[contains(text(),"Add Sub Folder")]').click
        sleep 2

        driver.find_element(:id, "folder-name").send_keys("#{folder_name}")
        driver.find_element(:id, "folder-description").send_keys("#{folder_description}")
        sleep 3
        driver.find_element(:xpath, '//div[@id="newFolder"]/div/div/div/form/fieldset/div[4]/div/button').click
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


    def folder_unshare_without_retain_copy(server, driver, folder_name)

      sleep 2

      begin
        driver.find_element(:css, '#logo-img').click
        sleep 2
        driver.find_element(:xpath, "//span[contains(..,'#{folder_name}')]").click
        sleep 15
        driver.find_element(:xpath, '//ul[@id="contextMenu"]/li[2]/a').click


        sleep 2
        driver.find_element(:xpath, '//div[@id="modal-table-control"]/div/button[2]').click

        sleep 2
        driver.find_element(:xpath, '//body[@id="ng-app"]/div[3]/div/div/div[3]/button[2]').click
        #//body[@id='ng-app']/div[4]/div/div/div[3]/button[2]
        #driver.find_element(:xpath, "//body[@id='ng-app']/div[4]/div/div/div[3]/button[2]").click


        sleep 2

      rescue Exception => e

        puts "folder_unshare_without_retain_copy(): button not found"
        #puts "Rescue"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
      end

    end


    def folder_unshare_with_retain_copy(server, driver, folder_name)

      sleep 2

      begin
        driver.find_element(:css, '#logo-img').click
        sleep 2
        driver.find_element(:xpath, "//span[contains(..,'#{folder_name}')]").click
        sleep 2
        driver.find_element(:xpath, '//ul[@id="contextMenu"]/li[2]/a').click
        sleep 2
        driver.find_element(:xpath, '//div[@id="modal-table-control"]/div/button[2]').click
        sleep 2
        driver.find_element(:css, 'input[name="chk"]').click
        sleep 2
        driver.find_element(:xpath, '//body[@id="ng-app"]/div[3]/div/div/div[3]/button[2]').click
        #driver.find_element(:xpath, "//body[@id='ng-app']/div[4]/div/div/div[3]/button[2]").click


        sleep 2

      rescue Exception => e

        puts "folder_unshare_with_retain_copy(): button not found"
        #puts "Rescue"
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
      end

    end

    def nested_long_name_folder_creation(server, driver, folder_name)
      begin
        sleep 2
        driver.find_element(:xpath, '(//button[@type="button"])[4]').click
        sleep (2)
        driver.find_element(:xpath, '//a[contains(text(),"Add Sub Folder")]').click
        sleep 2

        driver.find_element(:id, "folder-name").send_keys("#{folder_name}")
        driver.find_element(:id, "folder-description").send_keys("#{folder_description}")
        sleep 3
        driver.find_element(:xpath, '//div[@id="newFolder"]/div/div/div/form/fieldset/div[4]/div/button').click
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


    def received_folder_edit(server, driver, folder_name)
      begin
        driver.find_element(:xpath, "//span[contains(..,'#{folder_name}')]").click
        sleep 2
        driver.find_element(:xpath, '//a[contains(text(),"Edit Link")]').click
        sleep 2
        driver.find_element(:xpath, '//input[@type="checkbox"]').click
        sleep 2
        driver.find_element(:xpath, '(//button[@type="submit"])[27]').click
      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def folder_moved_to_shared_folder(server, driver, folder_name, destination_folder)
      begin
        driver.find_element(:xpath, "//span[contains(..,'#{folder_name}')]").click
        sleep 2
        driver.find_element(:xpath,"//a[contains(text(),'Move')]").click
        sleep 2
        # driver.switch_to.window("modal-dialog")
        # driver.find_element(:xpath, "//div[@id='moveItem']/div/div/div/form/fieldset/div/table/tbody/tr/td/a/span").click
        # driver.find_element(:link, "Folder1").click
        # driver.find_element(:xpath, "//div[@title='#{destination_folder}']").click
        # driver.find_element(:xpath, "//span[contains(..,'#{destination_folder}')]").click
        driver.find_element(:class,'ng-binding').find_element(:title, 'Folder1').click
        sleep 2
        driver.find_element(:xpath,"//div[@id='moveItem']/div/div/div/form/fieldset/div[2]/div/button").click

      rescue Exception => e
        puts __FILE__
        puts caller_locations
        ob=Pause::PauseScript.new
        ob.pause_script_exception
        puts e.message
        #puts "Rescue"
      end
    end

    def shared_folder_moved_to_shared_folder(server, driver, folder_name)
      begin
        driver.find_element(:xpath, "//span[contains(..,'#{folder_name}')]").click
        sleep 2
        driver.find_element(:xpath,"//a[contains(text(),'Move')]").click
        driver.find_element(:xpath, "//div[@id='moveItem']/div/div/div/form/fieldset/div/table/tbody/tr/td/a/span").click
        driver.find_element(:xpath, "//a[@class='file-name']/descendant::span[title()='#{destination_folder}']").click
        driver.find_element(:link, "Folder1").click
        # driver.find_element(:xpath, "//span[contains(..,'#{destination_folder}')]").click
        sleep 2
        driver.find_element(:xpath,"//div[@id='moveItem']/div/div/div/form/fieldset/div[2]/div/button").click

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

