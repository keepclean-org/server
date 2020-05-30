module LicenseFinder
  class Integration < ::Integration
    def self.logo
      "license_finder_logo.svg"
    end

    def allowed_licenses
      config['allowed_licenses']&.join($/)
    end

    def build_config(params)
      {
        allowed_licenses: params[:allowed_licenses].lines.map(&:strip)
      }
    end
  end
end
