module PanelProviders
  module Pricing
    module Factory
      def self.provider(code)
        # "PanelProviders::Pricing::#{code}".constantize
        # this provides better validation and allows mapping
        case code.to_s
        when 'Provider1' then PanelProviders::Pricing::Provider1
        when 'Provider2' then PanelProviders::Pricing::Provider2
        when 'Provider3' then PanelProviders::Pricing::Provider3
        else raise ArgumentError, "Unknown provider code #{code}"
        end
      end
    end
  end
end
