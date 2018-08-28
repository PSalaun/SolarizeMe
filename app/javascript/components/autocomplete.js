function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var projectAddress = document.getElementById('project_address');

    if (projectAddress) {
      var autocomplete = new google.maps.places.Autocomplete(projectAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(projectAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
