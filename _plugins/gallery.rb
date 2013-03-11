# Extended from:
# http://baldowl.github.com/2011/04/13/rough-gallery-plugin-for-jekyll.html
#
# Basic usage: add a `gallery` attribute to the YAML header of any page with
# value being the filename extension of your images.
# 
# This script looks for any files with your `gallery` extension that does NOT
# end with "-thumb.ext" or "@2x.ext". It sorts all the matching files alpha-
# betically and puts in in an array full of hashes that look like:
# {
#   'url': <image URL>,
#   'thumb': <image-URL for "-thumb" files>,
#   'name': <image filename with underscores converted to space and numbers removed>
# }
# the "-thumb" thing is only string manipulation, if you don't use it, fine,
# if you do just add the files with a "-thumb" suffix and use image.thumb for
# the src attribute.

module Jekyll
  class Gallery < Generator
    safe true

    def generate site
      site.pages.each do |page|
        gallery(site, page) if page.data['gallery']
      end
    end

    def gallery site, page
      base = page.instance_variable_get :@dir
      search = File.join '**', "*.#{page.data['gallery']}"
      images = Dir.chdir(base[1..-1] || '.') do
        Dir.glob(search).select {|image| ! image.include? "-thumb.#{page.data['gallery']}" and ! image.include? "@2x.#{page.data['gallery']}"}.sort
      end
      items = images.map {|image| {
        'url' => image,
#        'url' => (File.join base, image),
        'thumb' => image.gsub(/\.(#{page.data['gallery']})$/, '-thumb.\1'),
        'name' => image.gsub(/^\d+_+/, '').gsub(/\.#{page.data['gallery']}$/, '').gsub(/_+/, ' ')
      }}
      page.data = page.data.deep_merge 'gallery_items' => items
    end
  end
end
