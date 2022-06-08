class Todo < ApplicationRecord

  before_save :track_done_todo
  
  enum status: {
    'To Do': 0,
    'In progress': 1,
    'Done': 2
  }

  has_one :completed_history, class_name: 'CompletedHistory'

  validates :name, :description, :status, :due_date, presence: true
  validate :due_date_cannot_be_in_the_past

  def track_done_todo
    if status_changed? && status == 'Done'
      create_completed_history(completed_date: Time.now)
    end
  end

  def expired?
    Time.now > due_date
  end

  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end
end
