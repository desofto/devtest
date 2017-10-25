class EvaluateTargetService < BaseService
  should_be_provided :country_code, :target_group_id, :locations

  def run
    # It should require all of the following params to be provided and valid:
    # - :country_code
    # - :target_group_id
    # - :locations  (an array of hashes which look like this { id: 123, panel_size: 200 })
    # and return a price based on a logic specific to each panel provider used by a country.

    # I've lost in these relations because not understood them at all from task description

    locations.map do |item|
      location = Location.find(item['id'])
      panel_size = item['panel_size']
      prices =
        location
          .location_groups
          .joins(country: [:target_groups])
          .where(countries: { country_code: country_code })
          .where(target_groups: { id: target_group_id })
          .map(&:panel_provider)
          .map(&:price)

      panel_size * prices.sum
    end
  end
end
