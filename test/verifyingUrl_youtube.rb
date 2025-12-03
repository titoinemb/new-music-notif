require_relative "../src/utils/verifyingUrl/youtube"

puts verifyingUrl_youtube?("https://www.youtube.com/@freezecorleone7615", "/usr/bin/librewolf")                 # true
puts verifyingUrl_youtube?("https://www.youtube.com/@UCPj63YTEirrOXgCp5xiBYJQ", "/usr/bin/librewolf")           # true
puts verifyingUrl_youtube?("https://www.youtube.com/channel/UCPj63YTEirrOXgCp5xiBYJQ", "/usr/bin/librewolf")    # true
puts verifyingUrl_youtube?("https://music.youtube.com/channel/UCPj63YTEirrOXgCp5xiBYJQ", "/usr/bin/librewolf")  # false
puts verifyingUrl_youtube?("https://youtube.com", "/usr/bin/librewolf")                                         # false
puts verifyingUrl_youtube?("https://www.youtube.com", "/usr/bin/librewolf")                                     # false
puts verifyingUrl_youtube?("https://music.youtube.com", "/usr/bin/librewolf")                                   # false
puts verifyingUrl_youtube?("https://music.youtube.com/channel", "/usr/bin/librewolf")                           # false
puts verifyingUrl_youtube?("https://www.youtube.com/channel", "/usr/bin/librewolf")                             # false
puts verifyingUrl_youtube?("https://youtube.com/channel", "/usr/bin/librewolf")                                 # false
puts verifyingUrl_youtube?("https://music.youtube.com/@UCPj63YTEirrOXgCp5xiBYJQ", "/usr/bin/librewolf")         # false
puts verifyingUrl_youtube?("https://www.youtube.com/@freezecorleone7615a", "/usr/bin/librewolf")                # false
puts verifyingUrl_youtube?("https://www.youtube.com/@Squeezie", "/usr/bin/librewolf")                           # false