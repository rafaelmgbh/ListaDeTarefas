# frozen_string_literal: true

class Task < ApplicationRecord
  validates :description, presence: true
  validates :done, inclusion: { in: [true, false] }

  def symbol
    case status
    when 'done' then '✔'
    when 'expired' then '⚠'
    when 'pending' then '⏳'
    end
  end

  def color
    case status
    when 'done' then 'success'
    when 'expired' then 'danger'
    when 'pending' then 'primary'
    end
  end

  private

  def status
    return 'done' if done?

    due_date.past? ? 'expired' : 'pending'
  end
end
