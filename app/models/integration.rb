class Integration < ApplicationRecord
  include Configurable

  scope :ordered, -> { order(type: :asc) }

  def self.human_name
    name.deconstantize
  end
  delegate :human_name, to: :class

  def self.key
    name.deconstantize.underscore
  end
  delegate :key, to: :class

  def self.logo
    "no_logo.svg"
  end
  delegate :logo, to: :class

  def has_pronto?
    false
  end
end
