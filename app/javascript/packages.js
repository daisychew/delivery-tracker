document.addEventListener('DOMContentLoaded', function() {
  var selectAllCheckbox = document.getElementById('selectAllCheckbox');
  if (selectAllCheckbox) {
    selectAllCheckbox.addEventListener('change', function() {
      console.log("Select all checkbox changed:", selectAllCheckbox.checked);
      var checkboxes = document.querySelectorAll('input[name="selected_packages[]"]');
      checkboxes.forEach(function(checkbox) {
        checkbox.checked = selectAllCheckbox.checked;
        console.log("Checkbox", checkbox.value, "checked:", checkbox.checked);
      });
    });
  }
});
