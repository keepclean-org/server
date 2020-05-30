module RailsBestPractices
  class Integration < ::Integration
    def self.logo
      "rails_best_practices_logo.png"
    end

    def has_pronto?
      true
    end
  end
end
