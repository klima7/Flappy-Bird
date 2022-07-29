module RecurringImage
  def draw_recurring_image(image, map, speed, z=0, shift_x=0, shift_y=0)
    x1 = ((-map.shift / speed) + shift_x).to_i % Window::WIDTH
    x2 = x1 - Window::WIDTH
    image.draw(x1, shift_y, z=z)
    image.draw(x2, shift_y, z=z)
  end
end
