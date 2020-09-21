class Product < ApplicationRecord
  #validations
  validates :name, presence: true, uniqueness: true 
  validates :description, length: { in: 10..1000 }
  validates :price, numericality: { greater_than: 0}
  validates :inventory, numericality: { greater_than: 0}

  #scopes
  scope :name_search, -> (search_term) { where("name iLIKE ?", "%#{search_term}%")}

  #linked database calls
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  belongs_to :supplier
  has_many :images

  #functions
  def is_discounted?
    price < 10
  end
  def tax
    (price*0.09)
  end
  def total
    price + tax
  end
end
