require 'test_helper'

class ChoreTest < ActiveSupport::TestCase

  test 'daily chore is done if last_completed occurs today' do
    c = Chore.create
    ChoreCompletion.create(chore: c)
    assert c.done?
  end

  test 'daily chore is not done if last_completed < today' do
    c = Chore.create
    comp = ChoreCompletion.create(chore: c, created_at: Time.now - 1.day)
    assert !c.done?
  end

  test 'daily chore is done if last_completed is blank?' do
    c = Chore.create
    assert !c.done?
  end

  test 'weekly chore is done if last_completed is within the same week' do
    c = Chore.create(interval: :weekly)
    date = Date.today.all_week.to_a.sample
    comp = ChoreCompletion.create(chore: c, created_at: date)
    assert c.done?
  end

  test 'weekly chore is not done if last_completed is prior to this week' do
    c = Chore.create(interval: :weekly)
    comp = ChoreCompletion.create(chore: c, created_at: Date.today.prev_week)
    assert !c.done?
  end

  test 'weekly chore is not done if last_completed is blank' do
    c = Chore.create(interval: :weekly)
    assert !c.done?
  end

end
