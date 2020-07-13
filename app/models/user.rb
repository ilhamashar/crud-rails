class User < ApplicationRecord
  has_one :dompet

  has_secure_password
end
