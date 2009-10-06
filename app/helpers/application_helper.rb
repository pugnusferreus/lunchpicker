# Methods added to this helper will be available to all templates in the application.

require 'net/http'
require 'rexml/document'

module ApplicationHelper
  def error_messages_for_attribute(object, attribute, field_label)
    if object.errors.on(attribute)
      html = '<small class="errors"><ul>'
      object.errors.on(attribute).each do |message|
        html += "<li>" + field_label + " " + message + "</li>"
      end
      html += "</ul></small>"
    end
  end

  def map_canvas(id, address)
    return <<-HTML
      <div id='#{id}' class='map_canvas' style="display:none"></div>
      <script type='text/javascript'>
        $(function()
        {
            var div_id = "#{id}";
            $('#' + div_id).show('slow',function() 
            {
              showAddress(#{id.to_json}, #{address.to_json});     
            });
            
        });
      </script>
      
    HTML
  end

end
