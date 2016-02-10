class Chore < ActiveRecord::Base

  enum interval: [:daily, :weekly]

  belongs_to :user

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
