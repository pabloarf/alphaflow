class CompletedHistory < ApplicationRecord

  enum completed_status: {
    due: 0,
    on_time: 1
  }

  belongs_to :todo

  validates :completed_date, presence: true
  validates_associated :todo

  before_save :set_completed_status

  def set_completed_status
    self.completed_status = todo.expired? ? :due : :on_time
  end
end
