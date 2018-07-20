module ImageHelper
  # usage <%= inline_svg("logo"); %> assuming logo.svg is stored at source/images/svg/logo.svg

  # Import an .svg file into an inline svg
  # This will automatically look in source/images
  # You'll need to pass and subdirectories as well
  # as the filename and .svg
  def inline_svg(filename, options = {})
    asset = "source/assets/images/#{filename}"
    generate_inline_svg(asset, options)
  end

  # This will handle external SVGs (e.g. coming from Contentful)
  def inline_external_svg(url, options={})
    local_resource = LocalResource.new(url)

    # If the file exists, then we don't need to sync it
    if !File.exists?(local_resource.full_path)
      local_resource.sync
    end

    generate_inline_svg(local_resource.full_path, options)
  end

  private

  def generate_inline_svg(asset, options={})
    if File.exists?(asset)
      file = File.open(asset, 'r') { |f| f.read }
      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      svg = doc.at_css("svg")

      if options[:class].present?
        svg["class"] = options[:class]
      end

      doc
    else
      %(
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 30"
          width="400px" height="30px"
        >
          <text font-size="16" x="8" y="20" fill="#cc0000">
            Error: '#{asset}' could not be found.
          </text>
          <rect
            x="1" y="1" width="398" height="28" fill="none"
            stroke-width="1" stroke="#cc0000"
          />
        </svg>
      )
    end
  end
end
