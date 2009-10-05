# Methods added to this helper will be available to all templates in the application.
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

  def generate_map_canvas(id,address)
    if(!address.nil? && !id.nil? && id != "") then
      html = <<EOF
      <div id='#{id}' class='map_canvas' />
      <script type='text/javascript'>
        $(function()
        {
          initMap('#{address}','#{id}');
        });
      </script>
EOF
    end
  end

end

