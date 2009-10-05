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

  def map_canvas(id, address)
    return <<-HTML
      <div id='#{id}' class='map_canvas'></div>
      <script type='text/javascript'>
        $(function()
        {
          initMap(#{address.to_json}, #{id.to_json});
        });
      </script>
    HTML
  end

end

