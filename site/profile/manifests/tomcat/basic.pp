class profile::tomcat::basic {
  include ::java
  ::tomcat::install { '/opt/tomcat':
    source_url => 'http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.69/bin/apache-tomcat-7.0.69.tar.gz',
  }
  ::tomcat::instance { 'default':
    catalina_home => '/opt/tomcat',
  }
}
