def prompt(description)
  puts "Please enter #{description}"
  gets.chomp
end

def error(code)
  puts "Error: #{code}"
end

def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "*** Calc-U-L8R ***"
  puts "Please choose whether to keep it simple, or push the boundaries"
  print "(b)asic, (a)dvanced, (s)leeps till Christmas, a(g)e, (v)olume calculator, (c)onverter or (q)uit: "
  prompt("Choice").downcase
end

def basic_calc
  # ask the user which operation they want to perform
  puts "Good choice - which simple operation do you want to perform"
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase
  
  num1 = prompt("First Number").to_f
  num2 = prompt("Second Number").to_f

  case operation
  when 'a' 
    operator = :+
  when 's'
    operator = :-
  when 'm'
    operator = :*
  when 'd'
    if num2 == 0 then 
      error("can't divide by zero")
      num2=prompt("Re-enter second number").to_f
    end
    operator = :/
  end

  result = calculate(num1, num2, operator)

  print "Result: #{result}"

  # pause for a couple of seconds - but is this the best way of delaying sending the user back? What if they need more than two seconds to read the screen? (or less)
  wait = gets.chomp
end

def advanced_calc
  puts "Good choice - which simple operation do you want to perform"
  print "(s)quare root or (p)ower: "
  operation = gets.chomp.downcase
  
  num1 = prompt("A Number").to_i
 
  case operation
  when 's' 
    result =  Math.sqrt(num1)
  when 'p'
    num2 = prompt("Another Number").to_i
    result = num1 ** num2
  end

  print "Result: #{result}"

  # pause for a couple of seconds - but is this the best way of delaying sending the user back? What if they need more than two seconds to read the screen? (or less)
  puts "press enter to start again"
  sleep = gets
end

def sleeps_calc
  puts "Can you believe it is only"
  today = Time.new
  xmas_date = Time.new(2015,12,25)
  sleeps_left_secs = (xmas_date - today) #in seconds
  day_in_seconds = 24 * 60 * 60
  sleeps_left_days = (sleeps_left_secs / day_in_seconds).ceil
  print "#{sleeps_left_days} until Santa is here! \n"
  puts "press enter to start again"
  sleep = gets
end

def age_calc
  puts "Lets find out how young you are! \n Please enter the year of your birth YYYY:"
  begin
    age_year = gets.chomp.to_i
    print Time.new.year - age_year 
  end
  puts "\n press enter to start again"
  sleep = gets
end

def converter_calc
  puts "What would you like to convert?" 
  print "(m)etres to feet, (f)eet to metres, m(i)les per hour to (k)ilometers per hour or kilometers per hour to miles per hour? \n"
  operation = gets.chomp.downcase

  case operation
  when 'm'
    num1 = prompt("Whats is the length in metres?").to_f
    result = num1 * 3.28084
  when 'f'
    num1 = prompt("Whats is the length in feet?").to_f
    result = num1 / 3.28084
  when 'i'
    num1 = prompt("What speed (MPH) do you want converted (to KPH)").to_f
    result = num1 * 1.609344
  when 'k'
    num1 = prompt("what speed (KPH) do you want converted (to MPH)").to_f
    result = num1 / 1.609344
  end
  print "Result: #{result} \n \n"
  puts "press enter to start again"
  sleep = gets
end


def volume_calc
  puts "What shape would you like to find the volume of?"
  print "(c)ube, c(i)rcular cylinder or ci(r)cular cone: "
  operation = gets.chomp.downcase
  
  num1 = prompt("Height").to_f
  
  case operation
  when 'c' 
    result =  num1**3
  when 'i'
    num2 = prompt("Radius").to_f
    result = Math::PI* num2**2 *num1
  when 'r'
    num2 = prompt("Radius").to_f
    result = Math::PI * num2**2 * num1/3 
  end
  print "Result: #{result} \n \n"
  puts "press enter to start again"
  sleep = gets
end 

def calculate(num1, num2, operator)
  return num1.send(operator, num2)
end

response = menu

until response == 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  when 's'
    sleeps_calc
  when 'g'
    age_calc
  when 'v'
    volume_calc
  when 'c'
    converter_calc
  else
    error("please choose one of the options")
    sleep 2
  end

  response = menu
end
