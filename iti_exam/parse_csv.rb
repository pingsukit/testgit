require "csv"

persons = [] 

first_line = true 

CSV.foreach("./data.csv", col_sep: ",") do |row|
  if first_line == true
    first_line = false
    next
  end 

  full_name = row[0]
  score = row[1]
  color = row[2]

  persons << { full_name: full_name, score: score, color: color }  
end

puts persons.to_s

# highest score
puts "Person with the highest score: \n" + persons.max_by{ |person| person[:score] }[:full_name]

# lowest score
puts "Person with the lowest score: \n" + persons.min_by{ |person| person[:score] }[:full_name]

# mean score
sum_scores = 0
persons.each do |person|
  sum_scores = sum_scores + person[:score].to_i
end

puts "Mean score: \n" + (sum_scores/persons.length).to_s

# most popular color
color_stats = Hash.new {|h, k| h[k] = 0}

persons.each do |person|
  color = person[:color]
  color_stats[color] = color_stats[color] + 1
end


# most popular color
max_value = color_stats.values.max # no, not the one like 7-11
all_the_maxes = Hash[color_stats.select { |k, v| v == max_value}]
puts "Most popular color(s): "
all_the_maxes.each do |k,v|
  puts k
end

# least popular color

min_value = color_stats.values.min # no, not the one like 7-11
all_the_mins = Hash[color_stats.select { |k, v| v == min_value}]
puts "Least popular color(s): "
all_the_mins.each do |k,v|
  puts k
end

puts "Weird name capitalizations: "
persons.each do |person|
  full_name = person[:full_name].split(" ")
  # capitalize last letter of last name
  # lowercase the first letter of last name
  last_name = full_name.first
  modified_last_name = last_name[0].downcase + last_name[1..-2] + last_name[-1].upcase

  # capitalize last letter of first name
  # lowercase the first letter of first name
  modified_first_name = full_name[1][0].downcase + full_name[1..-1].join(" ")[1..-2] + full_name[1..-1].join(" ")[-1].upcase
  
  puts modified_last_name + " " + modified_first_name
end

