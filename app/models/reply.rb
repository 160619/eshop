# frozen_string_literal: true

# Reply
class Reply < ApplicationRecord
  belongs_to :review
  belongs_to :user
end
