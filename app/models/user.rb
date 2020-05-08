class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

validates :first_name, :last_name,
            presence: true,
            length: {in: 3..35}
  validates :email,
            presence: true,
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Wrong email format" }
  validates :age,
            numericality: {only_integer: true, greater_than: 18}

  def full_name
    "#{first_name} #{last_name}"
  end
end
