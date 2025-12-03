require_relative "../src/utils/verifyingUrl/spotify"

puts verifyingUrl_spotify?("https://open.spotify.com/artist/76Pl0epAMXVXJspaSuz8im", "/usr/bin/librewolf")  # true
puts verifyingUrl_spotify?("https://spotify.com/artist/76Pl0epAMXVXJspaSuz8im", "/usr/bin/librewolf")       # flase
puts verifyingUrl_spotify?("https://open.spotify.com/artist/1", "/usr/bin/librewolf")                       # false
puts verifyingUrl_spotify?("https://spotify.com/artist/76Pl0epAMXVXJspaSuz8im", "/usr/bin/librewolf")       # false
puts verifyingUrl_spotify?("https://spotify.com/artist/76Pl0epAMXVXJspaSuz8im/kaka", "/usr/bin/librewolf")  # false