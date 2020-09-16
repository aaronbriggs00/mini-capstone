class Product < ApplicationRecord
  #validations
  validates :name, presence: true, uniqueness: true 
  validates :description, length: { in: 10..1000 }
  validates :price, numericality: { greater_than: 0}
  validates :image_path, presence: true
  validates :inventory, numericality: { greater_than: 0}

  # validates_format_of :image_path, :with => %r{\.(png|jpg|jpeg)$}i






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
