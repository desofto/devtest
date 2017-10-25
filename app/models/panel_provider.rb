class PanelProvider < ApplicationRecord
  def price
    pricing_service.new.run
  end

  private

  def pricing_service
    PanelProviders::Pricing::Factory.provider(code)
  end
end
