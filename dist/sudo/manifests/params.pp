# Class: sudo::params
#
# Set the parameters for sudo on different operating systems
#
class sudo::params {
  case $::operatingsystem {
    'FreeBSD': {
      $visudo_cmd   = '/usr/local/sbin/visudo'
      $sudoers_file = '/usr/local/etc/sudoers'
      $sudoers_tmp  = '/usr/local/etc/sudoers.tmp'
      $sudo_pkg     = 'security/sudo'
    }
    'SLES': {
      $visudo_cmd   = '/usr/sbin/visudo'
      $sudoers_file = '/etc/sudoers'
      $sudoers_tmp  = '/etc/sudoers.tmp'
      $sudo_pkg     = 'sudo'
      $visiblepw    = false # Because sles 11 sudo is dinosaurian
    }
    'SunOS','Solaris': {
      case $::kernelrelease {
        '5.10': {
          $visudo_cmd   = '/sbin/visudo'
          $sudoers_file = '/etc/sudoers'
          $sudoers_tmp  = '/etc/sudoers.tmp'
          $sudo_pkg     = 'sudo'
        }
        '5.11': {
          $visudo_cmd   = '/sbin/visudo'
          $sudoers_file = '/etc/sudoers'
          $sudoers_tmp  = '/etc/sudoers.tmp'
          $sudo_pkg     = 'security/sudo'
        }
      }
    }
    default: {
      $visudo_cmd   = '/usr/sbin/visudo'
      $sudoers_file = '/etc/sudoers'
      $sudoers_tmp  = '/etc/sudoers.tmp'
      $sudo_pkg     = 'sudo'
      $visiblepw    = true
    }
  }
}
