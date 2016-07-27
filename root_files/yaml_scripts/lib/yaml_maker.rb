#!/usr/bin/env ruby

# this is a crappy, horrible script that just helps generate yaml
# data without having to do it all by hand.

require 'securerandom'
require 'stringio'

class YamlMaker

  KNOWN_DATA_TYPES = ["uuid", "serverlist", "ip", "iplist", "big_map"]

  def usage()
    puts "Usage: #{$0} <#{KNOWN_DATA_TYPES.join("|")}> <args>"
    exit 1
  end

  def main()
    type = ARGV[0]

    unless type
      usage()
    end

    case type
      when "uuid"
        prefix = ARGV[1]
        count = ARGV[2]
        make_uuids(0, prefix, count)
      when "serverlist"
        key = ARGV[1]
        count = ARGV[2]
        make_serverlist(0, key, count)
      when "iplist"
        key = ARGV[1]
        count = ARGV[2]
        make_iplist(0, key, count)
      when "ip"
        prefix = ARGV[1]
        count = ARGV[2]
        make_ips(0, prefix, count)
      when "big_map"
        key = ARGV[1]
        num_keys = ARGV[2]
        make_big_map(key, num_keys)
      else
        puts "UNRECOGNIZED DATA TYPE: #{type}"
    end
  end

  def uuid_usage()
    puts "Usage: #{$0} uuid <prefix> <count>"
    exit 1
  end

  def make_uuids(indent, prefix, count)
    unless prefix and count
      uuid_usage()
    end

    rv = StringIO.new
    (1..count.to_i).each do |i|
      rv.puts"#{"  " * indent}#{prefix}#{i}: '#{SecureRandom.uuid}'"
    end
    rv.string
  end

  def serverlist_usage()
    puts "Usage: #{$0} serverlist <key> <count>"
    exit 1
  end

  def make_serverlist(indent, key, count)
    unless key and count
      serverlist_usage()
    end

    rv = StringIO.new
    rv.puts("#{"  " * indent}#{key}:")
    (1..count.to_i).each do |i|
      rv.puts "#{"  " * indent}  - 'foo#{i}.mycompany.org'"
    end
    rv.string
  end

  def iplist_usage()
    puts "Usage: #{$0} iplist <key> <count>"
    exit 1
  end

  def make_iplist(indent, key, count)
    unless key and count
      iplist_usage()
    end

    rv = StringIO.new
    rv.puts "#{"  " * indent}#{key}:"
    (1..count.to_i).each do |i|
      rv.puts "#{"  " * indent}  - '127.0.0.#{i}'"
    end
    rv.string
  end

  def ip_usage()
    puts "Usage: #{$0} ip <prefix> <count>"
    exit 1
  end

  def make_ips(indent, prefix, count)
    unless prefix and count
      ip_usage()
    end

    rv = StringIO.new
    (1..count.to_i).each do |i|
      rv.puts "#{"  " * indent}#{prefix}#{i}: '127.0.0.#{i}'"
    end
    rv.string
  end

  def big_map_usage()
    puts "Usage: #{$0} big_map <key> <num_keys>"
    exit 1
  end

  def make_nested_map_fields(result)
    # minimum 2 fields, maximum 5
    num_fields = 2 + rand(4)
    # make it slightly less likely to end up with a server/ip list
    field_seeds = ["uuid", "uuid", "ip", "ip", "serverlist", "iplist"]
    (1..num_fields).each do |i|
      field_type = field_seeds[rand(field_seeds.size)]
      case field_type
        when "uuid"
          result.puts(make_uuids(2, "uuid#{i}_", 1))
        when "serverlist"
          result.puts(make_serverlist(2, "servers#{i}", 2 + rand(10)))
        when "iplist"
          result.puts(make_iplist(2, "ips#{i}", 2 + rand(10)))
        when "ip"
          result.puts(make_ips(2, "ip#{i}_", 1))
      end
    end
  end

  def make_big_map(key, num_keys)
    unless key and num_keys
      big_map_usage()
    end

    rv = StringIO.new
    rv.puts "#{key}:"
    (1..num_keys.to_i).each do |i|
      rv.puts "  data#{i}:"
      make_nested_map_fields(rv)
    end
    rv.string
  end
end

