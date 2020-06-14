module Reek
  class Integration < ::Integration
    def self.logo
      "reek_logo.svg"
    end

    def has_pronto?
      true
    end
  end
end
