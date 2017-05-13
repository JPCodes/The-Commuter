module DashboardsHelper
  def generate_dashboard_content(preference_enum)
    NewsCache.find_specified_content(preference_enum)
  end
end
