class ChoreCompletion < ActiveRecord::Base
  belongs_to :chore
  belongs_to :user

  validate :unique_within_timeframe, on: :create

  def unique_within_timeframe
    matching = ChoreCompletion.where(chore_id: self.chore_id, user_id: self.user_id).where("created_at > ?", 1.hour.ago)
    if matching.any?
      errors.add(:chore_id, "has already been completed")
    end
  end
end
