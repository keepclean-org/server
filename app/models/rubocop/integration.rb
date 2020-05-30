module Rubocop
  class Integration < ::Integration
    def self.logo
      "rubocop_logo.svg"
    end

    def has_pronto?
      true
    end
  end
end
