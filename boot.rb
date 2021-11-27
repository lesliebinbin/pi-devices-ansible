#!/usr/bin/env ruby
require 'fileutils'
require 'yaml'
def boot
  mount_points, headless_configs = YAML.load_file('headless-pi-init.yml', symbolize_names: true)[:sdcard].values_at(
    :mount_points, :headless_configs
  )
  mount_points.each do |m_point|
    headless_configs.each do |h_config|
      puts h_config
      Dir["#{h_config}/*"].each do |filename|
        FileUtils.cp(filename, "#{m_point}/")
      end
    end
  end
end

boot if $PROGRAM_NAME == __FILE__
