class EcobeeError

  attr_reader :code, :message

  def initialize(attributes = {})
    status = attributes["status"]
    @code = status["code"]
    @message = status["message"]
  end
end