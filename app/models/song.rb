class Song < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[title song key time_signature tempo genre language created_at updated_at]
  end
end
