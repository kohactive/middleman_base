module UrlHelper
  # Get the full url with base domain
  def full_url(source)
    "#{config[:host]}#{source}"
  end
end
