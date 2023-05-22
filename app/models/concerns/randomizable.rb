# frozen_string_literal: true

# add a #random method to model to get a random row
module Randomizable
  extend ActiveSupport::Concern

  included do
    # first random record
    scope :random, -> { order('RANDOM()').limit(1).first }
  end
end
