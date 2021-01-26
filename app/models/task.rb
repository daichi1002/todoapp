class Task < ApplicationRecord
  validate :name, presence: true
end
