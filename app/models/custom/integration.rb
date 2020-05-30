module Custom
  class Integration < ::Integration
    configuration_attributes :class_name, :custom_config

    def human_name
      class_name&.gsub('Integration::', '') || super
    end

    def self.logo
      "custom_logo.svg"
    end
  end
end
