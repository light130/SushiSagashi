document.addEventListener('turbolinks:load', function() {
  document.querySelectorAll('#like').forEach(function(a) {
    a.addEventListener('ajax:success', function() {
      var like_form = a.parentNode
      like_form.style.display = 'none';
    });
  });
});
