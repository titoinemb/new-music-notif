# test for get the last title name of soundcloud artist
require_relative "../src/services/checking/soundcloud"

resultat = soundcloud("user-792341813", "/usr/bin/librewolf")

puts resultat