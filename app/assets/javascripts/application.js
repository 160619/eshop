// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require turbolinks
//= require rails-ujs
//= require_self

$(document).on("ready turbolinks:load", function() {
  $("#new_review")
    .on("ajax:success", function(event) {
      var data, status, xhr, _ref;
      (_ref = event.detail),
        (data = _ref[0]),
        (status = _ref[1]),
        (xhr = _ref[2]);
      $("#reviews").append(renderReviewItem(data));
      $("#aggregate_rating").html(data.product.aggregate_rating);
      $("#new_review")[0].reset();
      $("#error_explanation").html("");
    })
    .on("ajax:error", function(event) {
      $("#error_explanation").html(reviewErroForm(event.detail[0]));
    });

  function renderReviewItem(review) {
    return reviewItemTemplate(review);
  }

  function reviewItemTemplate(review) {
    return `
      <div id="review_item_${review.id}">
        <p>${review.user.email}</p>
        <p>Content: ${review.content}</p>
        <p>Rating: ${review.rating}</p>
        <ul id="comments_of_review_${review.id}"></ul>
        ${review.reply_form}
      </div>
      <hr />
    `;
  }

  function reviewErroForm(errors) {
    let errorList = document.createElement("ul");

    errors.forEach(function(error) {
      let errorItem = document.createElement("li");
      errorItem.appendChild(document.createTextNode(error));
      errorList.appendChild(errorItem);
    });
    return errorList;
  }
});
