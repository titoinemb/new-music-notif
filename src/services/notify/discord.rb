# import sorbet-runtime for add typage in ruby
require 'sorbet-runtime'
# import discordrb for send in pm
require 'discordrb'

# activate signature in this function
extend T::Sig

# typage for this function
sig {
  params(target_user_id: String, bot_token: String, content: String).returns(Void)
}
# function for send message in private
# @param target_user_id = your discord id
# @param bot_token      = the token of the bot
# @param content        = the message
def notify_discord(target_user_id, bot_token, content)
  bot = Discordrb::Bot.new token: bot_token

  bot.run :async

  until bot.connected?
    sleep 0.05
  end

  user = bot.user(target_user_id)

  if user
    user.pm(content)
  end
ensure
  bot.stop if bot
end