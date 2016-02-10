class Chore < ActiveRecord::Base

  enum interval: [:daily, :weekly]

  belongs_to :user
  has_many :chore_completions

  def last_completed
    chore_completions.order('created_at desc').first.try(:created_at)
  end

  def past_due?
    case interval
    when 'daily'
      last_completed && Time.zone.now.to_date - last_completed.to_date > 1
    when 'weekly'
      last_completed && Time.zone.now.to_date.cweek - last_completed.to_date.cweek > 1
    else
      false
    end
  end

  def done?
    case interval
    when 'daily'
      last_completed && last_completed >= Time.zone.now.to_date
    when 'weekly'
      last_completed && last_completed.to_date.cweek >= Time.zone.now.to_date.cweek
    else
      false
    end
  end

end
