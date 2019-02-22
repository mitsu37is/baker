class Message
  include ActiveModel::Model
  attr_accessor :account, :body
  validates :body, presence: true
end
