module BundleAudit
  class Integration < ::Integration
    def self.logo
      "bundle_audit_logo.svg"
    end

    def ignored_cve
      config['ignored_cve']&.join($/)
    end

    def build_config(params)
      {
        ignored_cve: params[:ignored_cve].lines.map(&:strip)
      }
    end
  end
end
