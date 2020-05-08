class City < ApplicationRecord 
  has_many :users

  validates :name,
            presence: true,
            uniqueness: true,
            length: {in: 3..35}
  validates :zip_code,
            presence: true,
            uniqueness: true,
            format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "Entrez un code zip valide!" }
end
