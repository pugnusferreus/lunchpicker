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

  def generate_map_canvas(location)
    if(!location.nil?) then
      return <<EOF
      lawl
      EOF
    end
  end

end

