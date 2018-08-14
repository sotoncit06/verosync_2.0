module Pause

  class PauseScript

    def pause_script_exception()

      #Test paused to upload using Applet
      message = "Script is paused until you handle the exception manually"
      title = "Exception handler"
      api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
      api.call(0, message, title, 0)
      sleep 2
    end

    def file_not_found()

      #This will give  alert for missing file
      message = "File not Found!!"
      title = "Exception handler"
      api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
      api.call(0, message, title, 0)
      sleep 2
    end


  end

end