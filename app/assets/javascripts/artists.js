function sendRequest(url, success) {
  $.ajax({
    url: url,
    type: "GET",
    cache: false,
    dataType: "json",
    success: function(data) {
      success(data);
    }
  });
}
