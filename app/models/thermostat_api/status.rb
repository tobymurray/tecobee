class Status
  def initialize(attributes)
    @code = attributes["code"]
    @message = attributes["message"]
  end
end