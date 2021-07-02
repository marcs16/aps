class Notification < ApplicationRecord

  scope :owned, ->(id) { where("'#{id}' = ANY(user_id)") }
  scope :created, -> {where("created_at >= ?", Time.zone.now.ago(12.hours))}
end
