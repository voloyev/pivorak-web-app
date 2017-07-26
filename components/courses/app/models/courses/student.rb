module Courses
  class Student < ApplicationRecord
    self.table_name = 'courses_students'

    belongs_to :season
    belongs_to :user
    has_one    :interview
    has_one    :test_task
    has_many   :homeworks
    has_many   :progresses

    delegate :full_name, to: :user
    delegate :email,     to: :user

    enum status: {
      enrolled: 0,
      test_task_done: 1,
      interviewing: 2,
      attending: 3,
      dropped: 4,
      graduated: 5,
      refused: 6
    }

    validates :personal_info, presence: true
    validates :motivation_info, presence: true
    validates :user_id, uniqueness: { scope: :season_id }
  end
end