# This calculates the angles between the hands on a clock for any given time. First it prompts the user how many times they will be inputting. Then it accepts the times in the format hh:mm:ss. After all times have been entered, it will return the angles in the format hm, hs, ms in degrees. 


# Used to get user input
def prompt(*args)
  print(*args)
  gets
end


# Returns the difference between 2 angles. Will always be >= 0 and <= 180 and have 2 decimal places. Returns a string. Takes numbers as arguments.
def calc_diff(first, second)
  result = (first - second).abs
  if result > 180
    result = 360 - result
  end
  result = result.round(2)
  array = result.to_s.split(".")
  if array[1].length < 2
    array[1] += "0"
    result = array.join(".")
  end
  return result
end


# Calculates the different angles between the hands on the clock for a given time. Returns a string of the three angles. Takes a string representation of time in the format "hh:mm:ss"
def calc_angle(string)
  string = string.to_s
  array = string.split(":")
  time = 0.0
  time = time + 60 * 60 * array[0].to_i if array[0]
  time = time + 60 * array[1].to_i if array[1]
  time = time + array[2].to_i if array[2]
  
  h_ang = (time * 360 / 43200) % 360
  m_ang = (time / 10) % 360
  s_ang = (time * 6) % 360
  hm = calc_diff(h_ang, m_ang)
  hs = calc_diff(h_ang, s_ang)
  ms = calc_diff(m_ang, s_ang)
  return "#{hm}, #{hs}, #{ms}"
end


# Asks the user to enter n number of times. Then displays n number of results. Returns nothing. Takes an integer.
def solve(number_times)
  answers = [number_times]
  (1..number_times).each do |t|
    time = prompt "Time #{t}?\n"
    answers << calc_angle(time)
  end
  answers.each do |ans|
    puts ans
  end
end


# Starts the program
q =  prompt "Number of inputs?\n"
solve(q.to_i)