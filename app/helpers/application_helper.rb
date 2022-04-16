module ApplicationHelper
    def flash_message(type, text)
        flash[type] ||= []
        flash[type] << text
        puts "added flash message #{flash.inspect}"
      end
end
