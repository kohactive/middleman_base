# Navigation helper is a nice way of showing a nav item
# as active or not. It can take in some options that are
# helpful and make life easy.
module NavigationHelper
  # Attributes
  #
  # name:     String is the display text for the link
  # url:      The URL for the link
  # options:  A valid hash of options that are available
  #           to a link_to in Padrino/Middleman
  # route_base: String, if you want a link to be active for subpages
  #             then you can specific that here.
  #
  # link_to("Design", "/services/design", route_base: "service", class: "custom-class")
  #
  def nav_link_to(name, url, options={}, &block)
    block if block_given?

    path       = current_page.path
    route_base = options.delete(:route_base) || name

    if route_base.present?
      if path.include?("/")
        current = path.split("/").first.downcase == route_base.downcase
      else
        current = path.split(".").first.downcase == route_base.downcase
      end
    else
      current = false
    end

    options[:href] ||= url

    if current
      options[:class] = options[:class] ? "#{options[:class]} active" : "active"
    end

    content_tag(:a, name, options, &block)
  end
end
