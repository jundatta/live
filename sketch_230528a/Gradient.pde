void set_gradient(color color1, color color2) {
  for (int y = 0; y < height + 1; y++) {
    float interp = map(y, 0, height, 0, 1);
    color interp_color = lerpColor(color1, color2, interp);
    stroke(interp_color);
    line(0, y, width, y);
  }
}

void sky_box_cycle(float time) {
  float[] time_stamps = {1 / 4.0f, 1 / 2.0f, 3 / 4.0f};

  float[] period_lengths = {time_stamps[0], time_stamps[1] - time_stamps[0], time_stamps[2] - time_stamps[1], 1 - time_stamps[2]};
  color[] day_grad = {color(142, 191, 255), color(220, 240, 255)};
  color[] sunset_grad = {color(219, 63, 110), color(199, 142, 77)};
  color[] night_grad = {color(0, 0, 50), color(32, 72, 145)};
  color[] sunrise_grad = {color(239, 172, 183), color(244, 192, 80)};

  float cycle_time = time / cycle_length; // normalize period time

  float light_cycle = 0.0f;
  color[] grad_from = null;
  color[] grad_to = null;
  if (cycle_time < time_stamps[0]) {
    light_cycle = sin(PI * cycle_time / (float)(2 * period_lengths[0]));
    light_cycle = sin(PI / 2.0f * sin(PI / 2.0f * sin(PI / 2.0f * light_cycle)));
    grad_from = sunset_grad;
    grad_to = night_grad;
  } else if (cycle_time < time_stamps[1]) {
    light_cycle = 1 - sin(PI * (cycle_time - time_stamps[0] + period_lengths[1]) / (float)(2 * period_lengths[1]));
    light_cycle = pow(light_cycle, 3);
    grad_from = night_grad;
    grad_to = sunrise_grad;
  } else if (cycle_time < time_stamps[2]) {
    light_cycle = sin(PI * (cycle_time - time_stamps[1]) / (float)(2 * period_lengths[2]));
    light_cycle = sin(PI / 2.0f * light_cycle);
    grad_from = sunrise_grad;
    grad_to = day_grad;
  } else {
    light_cycle = 1 - sin(PI * (cycle_time - time_stamps[2] + period_lengths[3]) / (float)(2 * period_lengths[3]));
    light_cycle = pow(light_cycle, 2);
    grad_from = day_grad;
    grad_to = sunset_grad;
  }

  color grad_col0 = lerpColor(grad_from[0], grad_to[0], light_cycle);
  color grad_col1 = lerpColor(grad_from[1], grad_to[1], light_cycle);
  set_gradient(grad_col0, grad_col1);
}
