module Configurable
  extend ActiveSupport::Concern

  class_methods do
    def configuration_attributes(*attrs)
      attrs.each do |attr|
        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{attr}
            config['#{attr}']
          end
        RUBY
      end

      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def build_config(params)
          {
            #{attrs.map{ |attr| "#{attr}: params[:#{attr}]"}.join(',')}
          }
        end
      RUBY
    end
  end
end
