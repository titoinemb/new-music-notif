require_relative "../src/utils/verifyingUrl/soundcloud"

puts verifyingUrl_soundcloud?("https://soundcloud.com/ajsndkasdkjasbdjkhsa", "/usr/bin/librewolf")        # flase
puts verifyingUrl_soundcloud?("https://soundcloud.com/ajsndkasdkjasbdjkhsa/track", "/usr/bin/librewolf")  # false
puts verifyingUrl_soundcloud?("https://soundcloud.com/", "/usr/bin/librewolf")                            # false
puts verifyingUrl_soundcloud?("https://soundcloud.com/ajsndkasdkjasbdjkhsa", "/usr/bin/librewolf")        # false
puts verifyingUrl_soundcloud?("https://soundcloud.com/user-792341813", "/usr/bin/librewolf")              # true