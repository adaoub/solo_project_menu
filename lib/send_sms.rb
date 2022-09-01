require "twilio-ruby"
require "dotenv/load"

class SendSms
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
