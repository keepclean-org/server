module Brakeman
  class Integration < ::Integration
    def self.logo
      "brakeman_logo.png"
    end

    def has_pronto?
      true
    end
  end
end
