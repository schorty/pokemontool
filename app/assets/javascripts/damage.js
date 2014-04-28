// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function animate_bar(selector, to_width) {
	var background_color = $(selector).css('background-color');

	if (to_width <= 20) {
		background_color = 'red';
	} else if (to_width <= 50) {
		background_color = 'yellow';
	} else {
		background_color = 'green';
	}

	$(selector).delay(300).animate({
		width: to_width + '%',
		'background-color': background_color
	}, 400);
}
