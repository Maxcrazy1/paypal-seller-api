class Order < ApplicationRecord
  belongs_to :user
  belongs_to :operation_type

end
