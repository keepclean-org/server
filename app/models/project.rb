class Project < ApplicationRecord
  belongs_to :user
  has_many :integrations, dependent: :destroy

  def has_integration?(integration)
    integrations.pluck(:type).any?(integration.to_s)
  end
end
