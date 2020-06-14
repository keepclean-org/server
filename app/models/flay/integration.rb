module Flay
  class Integration < ::Integration
    def has_pronto?
      true
    end

    def mass_threshold
      config['mass_threshold']
    end

    def ignored
      config['ignored']&.join($/)
    end

    def build_config(params)
      {
        mass_threshold: params[:mass_threshold],
        ignored: params[:ignored].lines.map(&:strip)
      }
    end
  end
end
