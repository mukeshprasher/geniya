class Event < ActiveRecord::Base
  belongs_to :user
  
  validates :title,  presence: true, length: { minimum: 2,  maximum: 30 }
  validates :description,  presence: true, length: { minimum: 2,  maximum: 200 }
  validates :start, presence: true
  validates :end, presence: true
#  validate :start_is_valid_datetime
#  validate :end_is_valid_datetime

  def start_is_valid_datetime
    errors.add(:start, 'must be a valid datetime') if ((DateTime.parse(start) rescue ArgumentError) == ArgumentError)
  end

  def end_is_valid_datetime
    errors.add(:end, 'must be a valid datetime') if ((DateTime.parse(self.end) rescue ArgumentError) == ArgumentError)
  end
end
