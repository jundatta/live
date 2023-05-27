function set_gradient(color1, color2) {
  for (let y = 0; y < height + 1; y++) {
    interp = map(y, 0, height, 0, 1);
    let interp_color = lerpColor(color1, color2, interp);
    stroke(interp_color);
    line(0, y, width, y);
  }
}

function sky_box_cycle(time) {
  time_stamps = [1 / 4, 1 / 2, 3 / 4];

  period_lengths = [time_stamps[0], time_stamps[1] - time_stamps[0], time_stamps[2] - time_stamps[1], 1 - time_stamps[2]];
  day_grad = [color(142, 191, 255), color(220, 240, 255)]
    sunset_grad = [color(219, 63, 110), color(199, 142, 77)]
    night_grad = [color(0, 0, 50), color(32, 72, 145)]
    sunrise_grad = [color(239, 172, 183), color(244, 192, 80)]

    cycle_time = time / cycle_length; // normalize period time

  if (cycle_time < time_stamps[0]) {
    light_cycle = sin(PI * cycle_time / (2 * period_lengths[0]));
    light_cycle = sin(PI / 2 * sin(PI / 2 * sin(PI / 2 * light_cycle)));
    grad_from = sunset_grad
      grad_to = night_grad
      cycle_str = "cycle 0"
  } else if (cycle_time < time_stamps[1]) {
    light_cycle = 1 - sin(PI * (cycle_time - time_stamps[0] + period_lengths[1]) / (2 * period_lengths[1]));
    light_cycle = pow(light_cycle, 3);
    grad_from = night_grad;
    grad_to = sunrise_grad;
    cycle_str = "cycle 1"
  } else if (cycle_time < time_stamps[2]) {
    light_cycle = sin(PI * (cycle_time - time_stamps[1]) / (2 * period_lengths[2]));
    light_cycle = sin(PI / 2 * light_cycle);
    grad_from = sunrise_grad;
    grad_to = day_grad;
    cycle_str = "cycle 2"
  } else {
    light_cycle = 1 - sin(PI * (cycle_time - time_stamps[2] + period_lengths[3]) / (2 * period_lengths[3]));
    light_cycle = pow(light_cycle, 2);
    grad_from = day_grad;
    grad_to = sunset_grad;
    cycle_str = "cycle 3"
  }

  grad_col0 = lerpColor(grad_from[0], grad_to[0], light_cycle);
  grad_col1 = lerpColor(grad_from[1], grad_to[1], light_cycle);
  set_gradient(grad_col0, grad_col1);
}
