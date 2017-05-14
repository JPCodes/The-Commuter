module DashboardsHelper
  def generate_dashboard_content(preference_enum)
    result = NewsCache.find_specified_content(preference_enum)
    result
  end
end
