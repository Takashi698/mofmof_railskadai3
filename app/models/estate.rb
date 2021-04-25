class Estate < ApplicationRecord
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :age, presence: true
  validates :note, length: { in: 1..145 }

  # accepts_nested_attributes_for :stations, allow_destroy: true, reject_if: 
  #     proc {|attributes| attributes['line_name'].blank? and 
  #     attributes['station_name'].blank? and 
  #     attributes['walking_time'].blank?}, allow_destroy: true
end
