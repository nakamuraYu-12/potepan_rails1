class Post < ApplicationRecord
  validates :title, presence: true, length:{maximum: 20}
  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :memo,  length:{maximum: 500}
  validate :start_end_check

  def start_end_check
    if (self.start_day != nil && self.end_day != nil)
      errors.add(:end_day, "は開始日より後に登録してください") unless
      self.start_day < self.end_day
    end
  end
end
