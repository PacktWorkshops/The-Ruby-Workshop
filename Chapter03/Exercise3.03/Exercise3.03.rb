def drive_decision(traffic_signal, weather, distance_to_signal, speed_limit) 

  if traffic_signal == :green 

    if weather == :sunny 

      speed_limit 

    elsif distance_to_signal >= 50 

      speed_limit 

    else 

      speed_limit * 0.9 

    end 

  elsif traffic_signal == :yellow 

    if weather == :sunny && distance_to_signal >= 50 

      speed_limit * 0.8 

    elsif weather == :sunny && distance_to_signal < 50 

      speed_limit * 0.5 

    elsif weather == :rainy && distance_to_signal >= 50 

      speed_limit * 0.8 

    elsif weather == :rainy && distance_to_signal < 50 

      speed_limit * 0.25 

    else 

      raise "Condition not handled" 

    end 

  else # red light 

    if weather == :sunny && distance_to_signal >= 50 

      speed_limit * 0.5 

    elsif weather == :rainy && distance_to_signal >= 50 

      speed_limit * 0.25 

    else 

      0 # all other conditions should stop the car 

    end 

  end 

End 


drive_decision(:green, :sunny, 100, 50) 

drive_decision(:yellow, :rainy, 50, 25) 

def drive_decision_when_green(weather, distance_to_signal, speed_limit) 

  case weather 

  when :sunny 

    speed_limit 

 when :rainy 

    if distance_to_signal >= 50 

        speed_limit 

    else 

        speed_limit * 0.9 

    end 

  else 

    raise "Not handled" 

  end 

end


def drive_decision_when_yellow(weather, distance_to_signal, speed_limit) 

  case weather 

  when :sunny 

    if distance_to_signal >= 50 

        speed_limit * 0.8 

    else 

        speed_limit * 0.5 

    end 

  when :rainy 

    if distance_to_signal >= 50 

        speed_limit * 0.8 

    else 

        speed_limit * 0.25 

    end 

  else 

    raise "Not handled" 

  end 

end 

def drive_decision_when_red(weather, distance_to_signal, speed_limit) 

  if distance_to_signal >= 50 

    case weather 

    when :sunny 

        speed_limit * 0.5 

    when :rainy 

        speed_limit * 0.25 

    else 

        raise "Not handled" 

    end 

  else 
        0 

  end 

end 

def drive_decision(traffic_signal, weather, distance_to_signal, speed_limit) 

    case traffic_signal 

    when :green 

        drive_decision_when_green(weather, distance_to_signal, speed_limit) 

    when :yellow 

    drive_decision_when_yellow(weather, distance_to_signal, speed_limit) 

 

    else 

        drive_decision_when_red(weather, distance_to_signal, speed_limit) 

 

    end 

end 