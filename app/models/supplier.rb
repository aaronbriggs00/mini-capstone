class Supplier < ApplicationRecord
#linked database call
# def products
#   Product.where(supplier_id: self.id)
# end
  has_many :products
end
