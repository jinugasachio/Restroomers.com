require 'open-uri'

module WebpackBundleHelper
  class BundleNotFound < StandardError; end

  def javascript_bundle_tag(entry, **options)
    if Rails.env.development?
      path = asset_bundle_path("#{entry}.js")
    else
      path = "packs/#{manifest.fetch("#{entry}.js")}"
    end
    
    options = {
      src: path,
      defer: true,
    }.merge(options)

    # async と defer を両方指定した場合、ふつうは async が優先されるが、
    # defer しか対応してない古いブラウザの挙動を考えるのが面倒なので、両方指定は防いでおく
    options.delete(:defer) if options[:async]
    javascript_include_tag '', **options
  end

  def stylesheet_bundle_tag(entry, **options)

    if Rails.env.development?
      path = asset_bundle_path("#{entry}.css")
    else
      path = "packs/#{manifest.fetch("#{entry}.css")}"
    end

    options = {
      href: path,
    }.merge(options)

    stylesheet_link_tag '', **options
  end


  private

  def asset_server
    port = Rails.env === "development" ? "3035" : "3000"
    "http://#{request.host}:#{port}"
  end

  def pro_manifest
    File.read("public/packs/manifest.json")
  end

  def dev_manifest
    OpenURI.open_uri("#{asset_server}/public/packs/manifest.json").read
  end

  def test_manifest
    File.read("public/packs/manifest.json")
  end

  def manifest
    return @manifest ||= JSON.parse(pro_manifest) if Rails.env.production?
    return @manifest ||= JSON.parse(dev_manifest) if Rails.env.development?
    return @manifest ||= JSON.parse(test_manifest)
  end

  def valid_entry?(entry)
    return true if manifest.key?(entry)
    raise BundleNotFound, "Could not find bundle with name #{entry}"
  end

  def asset_bundle_path(entry, **options)
    valid_entry?(entry)
    asset_path("#{asset_server}/public/packs/" + manifest.fetch(entry), **options)
  end
end
