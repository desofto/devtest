class LocationsService < BaseService
  should_be_provided :country_code

  def run
    # It should return locations which belong to the selected country based on it's current panel provider

    # I've lost in these relations because not understood them at all from task description

    Location
      .joins(location_groups: [:country])
      .where(countries: { country_code: country_code })
  end
end
