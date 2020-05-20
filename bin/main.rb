require './lib/scrape.rb'

url = 'https://javascript.info'
new_scrape = Scrape.new(url)

puts new_scrape.banner
puts new_scrape.instruction
print 'Response: '
option = gets.chomp

case option.to_i
when 1
  sections = new_scrape.parts
  puts "There are #{sections.count} basic Sections, namely: "
  sections.each_with_index { |part, i| puts "#{i + 1}. #{part}"}
when 2
  cats = new_scrape.categories_title
  puts "The tutorial is divided into #{cats.count} Categories:"
  cats.each_with_index { |cat, i| puts "#{i + 1}. #{cat}"}
when 3
  puts "All Categories with URL: \n"
  new_scrape.categories_with_url.each do |cat_url|
    cat_url.each { |cat, url| puts "#{cat} #{url} " }
    puts ''
  end
else
  puts new_scrape.end_scrape
end
