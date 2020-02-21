class Ingredient < ApplicationRecord
  has_many :doses

  validates :name, presence: true, uniqueness: true
  before_destroy :check_for_doses

  accepts_nested_attributes_for :doses

  private

  def check_for_doses
    if self.doses.any?
      raise ActiveRecord::InvalidForeignKey
      # errors[:base] << 'Cannot delete ingredients while doses exist'
    end
  end
end
