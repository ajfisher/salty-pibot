var raspi = require("raspi-io");
var five = require("johnny-five");

var board = new five.Board({
    io: new raspi()
});

board.on("ready", function() {

  // Create a standard `led` component instance
  // Pin is the last pin on the right header set.
  var led = new five.Led('GPIO21');

  // "blink" the led in 500ms
  // on-off phase periods
  led.blink(500);
});
