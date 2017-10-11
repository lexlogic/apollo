$(document).on('ready page:load turbolinks:load', function() {
  var sku

  $('a.checkin_part').click(function(e) {
    e.stopPropagation();  // prevent Rails UJS click event
    e.preventDefault();

    var action = $(this).data('action');
    sku = $(this).data('sku');

    ActiveAdmin.modal_dialog(
      "Type or Scan SKU: ",
      $(this).data('inputs'),
      function(inputs) {
        $("<form>")
          .attr("method", "post")
          .attr("action", action)
        .append(
          $("<input>")
            .attr("name", $('meta[name=csrf-param]').attr('content'))
            .val($('meta[name=csrf-token]').attr('content'))
        ).append(
          $("<input>")
            .attr("name", "inputs")
            .val(JSON.stringify(inputs))
        ).appendTo(document.body)
        .submit()
      })
  });

  $('body').on('modal_dialog:before_open', function(e, form) {
    $(form).find("input[name=sku]").val(sku);
  });
})