require 'test_helper'

class ChoreTest < ActiveSupport::TestCase

  test 'daily chore is done if last_completed occurs today' do
    c = Chore.new
    c.last_completed = Time.now
    assert c.done?
  end

  test 'daily chore is not done if last_completed < today' do
    c = Chore.new
    c.last_completed = Time.now - 1.day
    assert !c.done?
  end

  test 'daily chore is done if last_completed is blank?' do
    c = Chore.new
    assert !c.done?
  end

  test 'weekly chore is done if last_completed is within the same week' do
    c = Chore.new
    c.interval = :weekly
    Date.today.all_week.each do |date|
      c.last_completed = date
      assert c.done?
    end
  end

  test 'weekly chore is not done if last_completed is prior to this week' do
    c = Chore.new
    c.interval = :weekly
    c.last_completed = Date.today.prev_week
    assert !c.done?
  end

  test 'weekly chore is not done if last_completed is blank' do
    c = Chore.new
    c.interval = :weekly
    assert !c.done?
  end

end
