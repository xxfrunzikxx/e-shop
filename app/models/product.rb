class Product < ActiveRecord::Base
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item


  validates :price, :name, :quantity, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :quantity, numericality: {greater_than_or_equal_to: 0}

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      true
    else
      errors.add("There are some items")
      false
      end

  end
end
