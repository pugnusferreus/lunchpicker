module LocationsHelper
  def weather_info()
    return <<-HTML
      <script type="text/javascript" charset="utf-8">
      $(document).ready(function()
      {
        $("#weather_info_but").click(function()
        {
          $('#loading_bar_div').show();
          $('#weather_info_div').hide();
          var loc = $('#location_weather_location').val();

          $.ajax(
            {
              url:'/locations/weather_info/1',
              dataType: 'html',
              data: {'loc': loc},
              type:'get',
              success: function(html)
              {
                $("#weather_info_div").html(html);
                $("#weather_info_div").show();
                $("#loading_bar_div").hide();
              },
              error: function(request, error)
              {
                $("#weather_info_div").html('An error occurred looking up weather information.');
                $("#weather_info_div").show();
                $("#loading_bar_div").hide();
              }
            });

        });
      });
      </script>
    HTML
  end  
end
