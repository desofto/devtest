class TargetGroupsService < BaseService
  should_be_provided :country_code

  def run
    # It should return target groups which belong to the selected country based on it's current panel provider

    # I've lost in these relations because not understood them at all from task description

    TargetGroup
      .joins('JOIN countries USING (panel_provider_id)')
      .where(countries: { country_code: country_code })
      .count
  end
end
