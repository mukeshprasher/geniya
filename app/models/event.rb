class Event < ActiveRecord::Base
  belongs_to :user
  
  validates :title,  presence: true, length: { minimum: 1,  maximum: 30 }
  validates :description,  presence: true, length: { minimum: 1,  maximum: 200 }
  validates :start, presence: true
  validates :end, presence: true
  validate :start_is_valid_datetime
  validate :end_is_valid_datetime

  def start_is_valid_datetime
    errors.add(:start, 'must be a valid datetime') if ((DateTime.parse(start.to_s) rescue ArgumentError) == ArgumentError)
  end

  def end_is_valid_datetime
    if !self.start.nil? and (self.end <= self.start)
      errors.add(:end, 'must be greater than start time')
    end
  end
end
