solr_pkgs:
  pkg.installed:
    - names:
      - openjdk-7-jdk
      - solr-tomcat
      - libmysql-java

tomcat6:
  service:
    - running
    - enable: True
    - restart: True
    - watch:
      - file: '/etc/tomcat6/catalina.properties'
      - file: '/usr/share/solr/conf/data-config.xml'
      - file: '/usr/share/solr/conf/schema.xml'
      - file: '/usr/share/solr/conf/solrconfig.xml'
      - file: '/usr/share/solr/conf/dataimport.properties'

'/etc/tomcat6/catalina.properties':
  file.managed:
    - source: {{ pillar['solr']['catalina_properties_file'] }}
    - user: tomcat6
    - group: tomcat6
    - mode: 444

'/usr/share/solr/conf/data-config.xml':
  file.managed:
    - source: {{ pillar['solr']['data_config_xml_file'] }}
    - user: tomcat6
    - group: tomcat6
    - mode: 444
    - template: jinja

'/usr/share/solr/conf/schema.xml':
  file.managed:
    - source: {{ pillar['solr']['schema_xml_file'] }}
    - user: tomcat6
    - group: tomcat6
    - mode: 444

'/usr/share/solr/conf/solrconfig.xml':
  file.managed:
    - source: {{ pillar['solr']['solrconfig_xml_file'] }}
    - user: tomcat6
    - group: tomcat6
    - mode: 444

'/usr/share/solr/conf/dataimport.properties':
  file.managed:
    - user: tomcat6
    - group: tomcat6
    - mode: 444
