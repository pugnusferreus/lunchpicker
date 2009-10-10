module VenuesHelper
  def venue_search()
    return <<-HTML
      <script type="text/javascript" charset="utf-8">
      $(document).ready(function() {
        $("#search").click(function() {

          window.location = "/venues?location_id=" + $("#location_id").val();
        })
      });
    </script>
    HTML
  end
end
