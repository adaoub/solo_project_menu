require "twilio-ruby"
require "dotenv/load"

class SendSms
  # @account_sid = "AC21f846a94d9b08e5971a59fabbf92685"
  # @auth_token = "2313958e1c0222c200202996cb0279a1"

  def initialize(client)
    @client = client
  end

  def sms(to:, body:)
    @client.messages.create(
      from: "+16187871439",
      to: to,
      body: body,
    )
  end
end
