# import sorbet-runtime for add typage in ruby
require 'sorbet-runtime'

# activate signature in this function
extend T::Sig

# typage for this function
sig {
  params(id: String, token: String).returns(Void)
}
# function for send notif to telegram user/cannal
# @param id     if of user or cannal telegram
# @param token  the token of telegram bot
# @return       void
def notifing_telegram(id, token)

end