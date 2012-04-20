require 'jammed'

api_key = '987bcab01b929eb2c07877b224215c92'

jammed = Jammed.new(api_key)

# Print out a user's profile data
puts "IFTFOM's Profile:"
jammed.profile('IFTFOM').each {|k, v| puts "#{k} : #{v}"}

# Print out the names of all followers, followings, jams, and likes
puts "Followers:"
jammed.followers('IFTFOM').each { |f| puts f['name']}

puts "Followings:"
jammed.following('IFTFOM').each { |f| puts f['name']}

puts "Jams:"
jammed.jams('IFTFOM').each { |j| puts "#{j['artist']}: #{j['title']}"}

puts "Likes:"
jammed.likes('IFTFOM').each { |l| puts "#{l['artist']}: #{l['title']}"}

# Alternative way to access user-specific data:
# The Jammed::User object caches data, so each method 
# has a 'dangerous' version (ie #followers!) that clears
# and resets the cached data
iftfom = jammed.user('IFTFOM')

puts "Followers:"
iftfom.followers.each { |f| puts f['name']}

puts "Followings:"
iftfom.following.each { |f| puts f['name']}

puts "Jams:"
iftfom.jams.each { |j| puts "#{j['artist']}: #{j['title']}"}

puts "Likes:"
iftfom.likes.each { |l| puts "#{l['artist']}: #{l['title']}"}

puts "IFTFOM's Profile:"
iftfom.profile.each {|k, v| puts "#{k} : #{v}"}

# Non-user specific data
puts "Popular Jams:"
jammed.popular_jams.each { |j| puts "#{j['artist']}: #{j['title']}"}

puts "Suggested People:"
jammed.suggested_people.each { |p| puts p['name']}

#Searches
puts "Search by Name:"
jammed.search_name('IFTFOM').each {|p| puts p['name']}

puts "Search by Artist:"
jammed.search_artist('Talking Heads').each {|p| puts p['name']}

puts "Search by Track:"
jammed.search_track('The The', 'This is the Day').each {|p| puts p['name']}
