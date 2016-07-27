#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), "..", "lib", "yaml_maker.rb")
require 'fileutils'

root_dir = File.join(File.dirname(__FILE__), "..", "..", "..")

ym = YamlMaker.new

(1..400).each do |i|
  domain = 1 + rand(6)
  domain_name = "subdomain#{domain}.mycompany.org"
  host = "host#{i}.#{domain_name}"
  d = File.join(root_dir, "hieradata/nodes/#{domain_name}")
  FileUtils.mkdir_p(d)
  f = File.join(d, "#{host}.yaml")
  uuids = ym.make_uuids(0, "nodes::subdomain#{domain}_mycompany_org::host#{i}_subdomain#{domain}_mycompany_org::uuid",
                        2 + rand(15))
  m = ""

  if i < 15
    m = ym.make_big_map("nodes::subdomain#{domain}_mycompany_org::host#{i}_subdomain#{domain}_mycompany_org::uuid", 2 + rand(8))
  end

  File.write(f, "---\n" + uuids + "\n" + m)
end