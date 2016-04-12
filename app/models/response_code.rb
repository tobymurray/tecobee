class ResponseCode < ActiveRecord::Base

  def self.success
    ResponseCode.find_by_code(1)
  end

  def self.expired_token
    ResponseCode.find_by_code(14)
  end
end