class Conversation < ApplicationRecord
  include Friendlyable
  has_many :messages
end
