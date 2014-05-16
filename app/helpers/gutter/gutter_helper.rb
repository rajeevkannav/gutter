module TableMachinist
  def table_row(array, headers = false)
    _s = headers ? 'th' : 'td'
    _html = ''
    _html += '<tr>'
    array.each do |value|
      _html += "<#{_s}> #{value}</#{_s}>"
    end
    _html += '</tr>'
    _html
  end

  def table(c_out)
    _html = ''
    c_out.lines.each_with_index do |line, index|
      _html += table_row(line.split('|'), (index == 0))
    end
    _html
  end
end

module GeneralInformation

  def os
    `lsb_release -ds ` + `/bin/uname -r`
  end

  def uptime
    `uptime`
  end

  def hostname
    `/bin/hostname`
  end

  def server_time
    `/bin/date`
  end

end


module CpuCores
  def number_of_cores
    `LC_ALL=C /bin/grep -c ^processor /proc/cpuinfo`
  end
end

module DiskUsage
  def disk_usage
    raw table(`/bin/df | awk '{print $1 "|"  $2 "|" $3 "|" $4 "|" $5 "|" $6 " "$7}'`)
  end
end

module Utilities

  HEADERS = ['Software', 'Installation']


  Utils = {
      ruby: {version: '-v'},
      php: {version: '--version'},
      node: {version: '-v'},
      mysql: {version: '--version'},
      python: {version: '--version'},
      apache2: {version: '--version'},
      nginx: {version: '--version'},
      openssl: {version: 'version'},
      vsftpd: {version: '--version'},
      make: {version: '-v'}
  }


  def packages_headers
    table_row(HEADERS, true)
  end

  def packages_content
    html = ''
    Utils.each do |package_name|
      _version = `#{package_name.first.to_s} #{Utils[package_name.first][:version]}`
      _arr = [package_name.first.to_s, _version]
      html += table_row(_arr)
    end
    html
  end

  def packages
    raw [packages_headers, packages_content].join
  end

end

module LoadAverage
  def one_minute
    `/bin/cat /proc/loadavg | /usr/bin/awk '{print $1}'`
  end

  def five_minute
    `/bin/cat /proc/loadavg | /usr/bin/awk '{print $2}'`
  end

  def fiften_minute
    `/bin/cat /proc/loadavg | /usr/bin/awk '{print $3}'`
  end
end

module LastLogin
  def logins
    raw table(`/usr/bin/lastlog --time 365 | awk '{ print $1 "|" $2 "|" $3 "|" $5 "-" $6 "-" $4 " " $7 $8 " " $9}'`)
  end
end

module Online
  def online_users
    raw table(`PROCPS_FROMLEN=40 /usr/bin/w | /usr/bin/tail -n+2  | /usr/bin/awk '{print $1"|"$3"|"$4"|"$5"|"$8}'`)
  end
end

module InternetProtocolAddress

  def ips
    output = ''
    #output += "Internal ip (eth0) | #{`for interface in eth0; do for family in inet inet6; do /bin/ip -oneline -family $family addr show $interface | /bin/grep -v fe80 | /usr/bin/awk '{print $4}'; done; done`}\n"
    #output += "Internal ip (wlan0) | #{`for interface in wlan0; do for family in inet inet6; do /bin/ip -oneline -family $family addr show $interface | /bin/grep -v fe80 | /usr/bin/awk '{print $4}'; done; done`}"
    #output += "External ip | #{`GET http://ipecho.net/plain`}"
    #raw table(output)
  end

end

module Ping
  def pingo
    command_output = "Host|Time (in ms)\n"
    ['gnu.org', 'github.com', 'wikipedia.org'].each do |host|
      command_output += "#{host}|#{`/bin/ping -qc 2 'www.google.com' | /usr/bin/tail -n+5 | awk '{print $4}'`.split('/')[1]}\n"
    end
    raw table(command_output)
  end
end


module Users
  def users
    raw table(`/usr/bin/awk -F: '{if ($3<=499) print "system|"$1"|"$6; else print "user|"$1"|"$6; }' < /etc/passwd | sort -r`)
  end
end

module NetStat
  def network_stats
    raw table("Number of Connections|	IP Address\n#{`netstat -ntu | awk '{print "|"$5}' | sort  | uniq -c`}")
  end
end


module MemoryUsage
  def total_m
    `/usr/bin/free | awk '{ print $2 }'`.lines[1].chomp
  end

  def used_m
    `/usr/bin/free | awk '{ print $3 }'`.lines[1].chomp
  end

  def free_m
    `/usr/bin/free | awk '{ print $4 }'`.lines[1].chomp
  end
end

module Swaps
  def swap_usage
    raw table(`/bin/cat /proc/swaps | /usr/bin/awk '{print $1"|"$2"|"$3"|"$4"|"$5}'`)
  end
end


module Processes
  def ps
    raw table(`/bin/ps aux | awk '{print $1 "|" $2 "|" $3 "|" $4 "|" $5 "|" $6 "|" $7 "|" $8 "|" $9 "|" $10 "|" $11 }'`)
  end
end

module Bandwidth
  def bandwidth(type)
    _start = `cat /sys/class/net/eth0/statistics/#{type}_bytes`.chomp.to_i
    sleep(2)
    _end = `cat /sys/class/net/eth0/statistics/#{type}_bytes`.chomp.to_i
    (_end - _start)
  end
end

module Gutter
  module GutterHelper
    include TableMachinist
    include GeneralInformation
    include CpuCores
    include DiskUsage
    include Utilities
    include LastLogin
    include Processes
    include MemoryUsage
    include Swaps
    include Online
    include InternetProtocolAddress
    include LoadAverage
    include NetStat
    include Ping
    include Users
    include Bandwidth
  end
end

