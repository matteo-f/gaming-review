module ReviewsHelper
  def friendly_time(time)
    time.strftime("%B %dth %Y, %H:%M")
  end
end
