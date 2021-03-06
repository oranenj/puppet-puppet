# == Class: puppet
#
# This class installs and configures the puppet agent.
#
# === Parameters:
#
# $version::                                Specify a specific version of a package to
#                                           install. The version should be the exact
#                                           match for your distro.
#                                           You can also use certain values like 'latest'.
#
# $user::                                   Override the name of the puppet user.
#
# $group::                                  Override the name of the puppet group.
#
# $dir::                                    Override the puppet directory.
#
# $codedir::                                Override the puppet code directory.
#
# $vardir::                                 Override the puppet var directory.
#
# $logdir::                                 Override the log directory.
#
# $rundir::                                 Override the PID directory.
#
# $ssldir::                                 Override where SSL certificates are kept.
#
# $sharedir::                               Override the system data directory.
#
# $manage_packages::                        Should this module install packages or not.
#                                           Can also install only server packages with value
#                                           of 'server' or only agent packages with 'agent'.
#
# $package_provider::                       The provider used to install the agent.
#                                           Defaults to chocolatey on Windows
#                                           Defaults to undef elsewhere
#
# $package_source::                         The location of the file to be used by the
#                                           agent's package resource.
#                                           Defaults to undef. If 'windows' or 'msi' are
#                                           used as the provider then this setting is
#                                           required.
#
# $port::                                   Override the port of the master we connect to.
#
# $listen::                                 Should the puppet agent listen for connections.
#
# $listen_to::                              An array of servers allowed to initiate a puppet run.
#                                           If $listen = true one of three things will happen:
#                                           1) if $listen_to is not empty then this array
#                                           will be used.
#                                           2) if $listen_to is empty and $puppetmaster is
#                                           defined then only $puppetmaster will be
#                                           allowed.
#                                           3) if $puppetmaster is not defined or empty,
#                                           $fqdn will be used.
#
# $pluginsync::                             Enable pluginsync.
#
# $splay::                                  Switch to enable a random amount of time
#                                           to sleep before each run.
#
# $splaylimit::                             The maximum time to delay before runs.
#                                           Defaults to being the same as the run interval.
#                                           This setting can be a time interval in seconds
#                                           (30 or 30s), minutes (30m), hours (6h), days (2d),
#                                           or years (5y).
#
# $runinterval::                            Set up the interval (in seconds) to run
#                                           the puppet agent.
#
# $autosign::                               If set to a boolean, autosign is enabled or disabled
#                                           for all incoming requests. Otherwise this has to be
#                                           set to the full file path of an autosign.conf file or
#                                           an autosign script. If this is set to a script, make
#                                           sure that script considers the content of autosign.conf
#                                           as otherwise Foreman functionality might be broken.
#
# $autosign_entries::                       A list of certnames or domain name globs
#                                           whose certificate requests will automatically be signed.
#                                           Defaults to an empty Array.
#
# $autosign_mode::                          mode of the autosign file/script
#
# $autosign_content::                       If set, write the autosign file content
#                                           using the value of this parameter.
#                                           Cannot be used at the same time as autosign_entries
#                                           For example, could be a string, or
#                                           file('another_module/autosign.sh') or
#                                           template('another_module/autosign.sh.erb')
#
# $autosign_source::                        If set, use this as the source for the autosign file,
#                                           instead of autosign_content.
#
# $usecacheonfailure::                      Switch to enable use of cached catalog on
#                                           failure of run.
#
# $runmode::                                Select the mode to setup the puppet agent.
#
# $unavailable_runmodes::                   Runmodes that are not available for the
#                                           current system. This module will not try
#                                           to disable these modes. Default is []
#                                           on Linux, ['cron', 'systemd.timer'] on
#                                           Windows and ['systemd.timer'] on other
#                                           systems.
#
# $cron_cmd::                               Specify command to launch when runmode is
#                                           set 'cron'.
#
# $systemd_cmd::                            Specify command to launch when runmode is
#                                           set 'systemd.timer'.
#
# $show_diff::                              Show and report changed files with diff output
#
# $module_repository::                      Use a different puppet module repository
#
# $configtimeout::                          How long the client should wait for the
#                                           configuration to be retrieved before
#                                           considering it a failure.
#
# $ca_server::                              Use a different ca server. Should be either
#                                           a string with the location of the ca_server
#                                           or 'false'.
#
# $ca_port::                                Puppet CA port
#
# $ca_crl_filepath::                        Path to CA CRL file, dynamically resolves based on
#                                           $::server_ca status.
#
# $dns_alt_names::                          Use additional DNS names when generating a
#                                           certificate.  Defaults to an empty Array.
#
# $classfile::                              The file in which puppet agent stores a list
#                                           of the classes associated with the retrieved
#                                           configuration.
#
# $hiera_config::                           The hiera configuration file.
#
# $syslogfacility::                         Facility name to use when logging to syslog
#
# $auth_template::                          Use a custom template for the auth
#                                           configuration.
#
# $main_template::                          Use a custom template for the main puppet
#                                           configuration.
#
# $use_srv_records::                        Whether DNS SRV records will be used to resolve
#                                           the Puppet master
#
# $srv_domain::                             Search domain for SRV records
#
# $pluginsource::                           URL to retrieve Puppet plugins from during pluginsync
#
# $pluginfactsource::                       URL to retrieve Puppet facts from during pluginsync
#
# $additional_settings::                    A hash of additional main settings.
#
# == puppet::agent parameters
#
# $agent::                                  Should a puppet agent be installed
#
# $agent_noop::                             Run the agent in noop mode.
#
# $agent_template::                         Use a custom template for the agent puppet
#                                           configuration.
#
# $client_package::                         Install a custom package to provide
#                                           the puppet client
#
# $puppetmaster::                           Hostname of your puppetmaster (server
#                                           directive in puppet.conf)
#
# $prerun_command::                         A command which gets excuted before each Puppet run
#
# $postrun_command::                        A command which gets excuted after each Puppet run
#
# $systemd_unit_name::                      The name of the puppet systemd units.
#
# $service_name::                           The name of the puppet agent service.
#
# $agent_restart_command::                  The command which gets excuted on puppet service restart
#
# $environment::                            Default environment of the Puppet agent
#
# $agent_additional_settings::              A hash of additional agent settings.
#                                           Example: {stringify_facts => true}
#
# $remove_lock::                            Remove the agent lock when running.
#
# $client_certname::                        The node's certificate name, and the unique
#                                           identifier it uses when requesting catalogs.
#
# $dir_owner::                              Owner of the base puppet directory, used when
#                                           puppet::server is false.
#
# $dir_group::                              Group of the base puppet directory, used when
#                                           puppet::server is false.
#
# == puppet::server parameters
#
# $server::                                 Should a puppet master be installed as well as the client
#
# $server_user::                            Name of the puppetmaster user.
#
# $server_group::                           Name of the puppetmaster group.
#
# $server_dir::                             Puppet configuration directory
#
# $server_ip::                              Bind ip address of the puppetmaster
#
# $server_port::                            Puppet master port
#
# $server_ca::                              Provide puppet CA
#
# $server_ca_crl_sync::                     Sync puppet CA crl file to compile masters, Puppet CA Must be the Puppetserver
#                                           for the compile masters. Defaults to false.
#
# $server_crl_enable::                      Turn on crl checking. Defaults to true when server_ca is true. Otherwise
#                                           Defaults to false. Note unless you are using an external CA. It is recommended
#                                           to set this to true. See $server_ca_crl_sync to enable syncing from CA Puppet Master
#
# $server_http::                            Should the puppet master listen on HTTP as well as HTTPS.
#                                           Useful for load balancer or reverse proxy scenarios. Note that
#                                           the HTTP puppet master denies access from all clients by default,
#                                           allowed clients must be specified with $server_http_allow.
#
# $server_http_port::                       Puppet master HTTP port; defaults to 8139.
#
# $server_http_allow::                      Array of allowed clients for the HTTP puppet master. Passed
#                                           to Apache's 'Allow' directive.
#
# $server_reports::                         List of report types to include on the puppetmaster
#
# $server_implementation::                  Puppet master implementation, either "master" (traditional
#                                           Ruby) or "puppetserver" (JVM-based)
#
# $server_passenger::                       If set to true, we will configure apache with
#                                           passenger. If set to false, we will enable the
#                                           default puppetmaster service unless
#                                           service_fallback is set to false. See 'Advanced
#                                           server parameters' for more information.
#                                           Only applicable when server_implementation is "master".
#
# $server_external_nodes::                  External nodes classifier executable
#
# $server_template::                        Which template should be used for master
#                                           configuration
#
# $server_main_template::                   Which template should be used for master
#                                           related configuration in the [main] section
#
# $server_git_repo::                        Use git repository as a source of modules
#
# $server_dynamic_environments::            Use $environment in the modulepath
#                                           Deprecated when $server_directory_environments is true,
#                                           set $server_environments to [] instead.
#
# $server_directory_environments::          Enable directory environments, defaulting to true
#                                           with Puppet 3.6.0 or higher
#
# $server_environments::                    Environments to setup (creates directories).
#                                           Applies only when $server_dynamic_environments
#                                           is false
#
# $server_environments_owner::              The owner of the environments directory
#
# $server_environments_group::              The group owning the environments directory
#
# $server_environments_mode::               Environments directory mode.
#
# $server_envs_dir::                        Directory that holds puppet environments
#
# $server_envs_target::                     Indicates that $envs_dir should be
#                                           a symbolic link to this target
#
# $server_common_modules_path::             Common modules paths (only when
#                                           $server_git_repo_path and $server_dynamic_environments
#                                           are false)
#
# $server_git_repo_path::                   Git repository path
#
# $server_git_repo_mode::                   Git repository mode
#
# $server_git_repo_group::                  Git repository group
#
# $server_git_repo_user::                   Git repository user
#
# $server_git_branch_map::                  Git branch to puppet env mapping for the
#                                           default post receive hook
#
# $server_post_hook_content::               Which template to use for git post hook
#
# $server_post_hook_name::                  Name of a git hook
#
# $server_storeconfigs_backend::            Do you use storeconfigs? (note: not required)
#                                           false if you don't, "active_record" for 2.X
#                                           style db, "puppetdb" for puppetdb
#
# $server_app_root::                        Directory where the application lives
#
# $server_ssl_dir::                         SSL directory
#
# $server_package::                         Custom package name for puppet master
#
# $server_version::                         Custom package version for puppet master
#
# $server_certname::                        The name to use when handling certificates.
#
# $server_strict_variables::                if set to true, it will throw parse errors
#                                           when accessing undeclared variables.
#
# $server_additional_settings::             A hash of additional settings.
#                                           Example: {trusted_node_data => true, ordering => 'manifest'}
#
# $server_rack_arguments::                  Arguments passed to rack app ARGV in addition to --confdir and
#                                           --vardir.  The default is an empty array.
#
# $server_puppetdb_host::                   PuppetDB host
#
# $server_puppetdb_port::                   PuppetDB port
#
# $server_puppetdb_swf::                    PuppetDB soft_write_failure
#
# $server_parser::                          Sets the parser to use. Valid options are 'current' or 'future'.
#                                           Defaults to 'current'.
#
# === Advanced server parameters:
#
# $server_httpd_service::                   Apache/httpd service name to notify
#                                           on configuration changes. Defaults
#                                           to 'httpd' based on the default
#                                           apache module included with foreman-installer.
#
# $server_service_fallback::                If passenger is not used, do we want to fallback
#                                           to using the puppetmaster service? Set to false
#                                           if you disabled passenger and you do NOT want to
#                                           use the puppetmaster service. Defaults to true.
#
# $server_passenger_min_instances::         The PassengerMinInstances parameter. Sets the
#                                           minimum number of application processes to run.
#                                           Defaults to the number of processors on your
#                                           system.
#
# $server_passenger_pre_start::             Pre-start the first passenger worker instance
#                                           process during httpd start.
#
# $server_passenger_ruby::                  The PassengerRuby parameter. Sets the Ruby
#                                           interpreter for serving the puppetmaster
#                                           rack application.
#
# $server_config_version::                  How to determine the configuration version. When
#                                           using git_repo, by default a git describe
#                                           approach will be installed.
#
# $server_foreman_facts::                   Should foreman receive facts from puppet
#
# $server_foreman::                         Should foreman integration be installed
#
# $server_foreman_url::                     Foreman URL
#
# $server_foreman_ssl_ca::                  SSL CA of the Foreman server
#
# $server_foreman_ssl_cert::                Client certificate for authenticating against Foreman server
#
# $server_foreman_ssl_key::                 Key for authenticating against Foreman server
#
# $server_puppet_basedir::                  Where is the puppet code base located
#
# $server_enc_api::                         What version of enc script to deploy.
#
# $server_report_api::                      What version of report processor to deploy.
#
# $server_request_timeout::                 Timeout in node.rb script for fetching
#                                           catalog from Foreman (in seconds).
#
# $server_environment_timeout::             Timeout for cached compiled catalogs (10s, 5m, ...)
#
# $server_ca_proxy::                        The actual server that handles puppet CA.
#                                           Setting this to anything non-empty causes
#                                           the apache vhost to set up a proxy for all
#                                           certificates pointing to the value.
#
# $server_jvm_java_bin::                    Set the default java to use.
#
# $server_jvm_config::                      Specify the puppetserver jvm configuration file.
#
# $server_jvm_min_heap_size::               Specify the minimum jvm heap space.
#
# $server_jvm_max_heap_size::               Specify the maximum jvm heap space.
#
# $server_jvm_extra_args::                  Additional java options to pass through.
#                                           This can be used for Java versions prior to
#                                           Java 8 to specify the max perm space to use:
#                                           For example: '-XX:MaxPermSpace=128m'.
#
# $server_jruby_gem_home::                  Where jruby gems are located for puppetserver
#
# $allow_any_crl_auth::                     Allow any authentication for the CRL. This
#                                           is needed on the puppet CA to accept clients
#                                           from a the puppet CA proxy.
#
# $auth_allowed::                           An array of authenticated nodes allowed to
#                                           access all catalog and node endpoints.
#                                           default to ['$1']
#
# $server_default_manifest::                Toggle if default_manifest setting should
#                                           be added to the [main] section
#
# $server_default_manifest_path::           A string setting the path to the default_manifest
#
# $server_default_manifest_content::        A string to set the content of the default_manifest
#                                           If set to '' it will not manage the file
#
# $server_ssl_dir_manage::                  Toggle if ssl_dir should be added to the [master]
#                                           configuration section. This is necessary to
#                                           disable in case CA is delegated to a separate instance
#
# $server_ssl_key_manage::                  Toggle if "private_keys/${::puppet::server::certname}.pem"
#                                           should be created with default user and group. This is used in
#                                           the default Forman setup to reuse the key for TLS communication.
#
# $server_puppetserver_vardir::             The path of the puppetserver var dir
#
# $server_puppetserver_rundir::             The path of the puppetserver run dir
#
# $server_puppetserver_logdir::             The path of the puppetserver log dir
#
# $server_puppetserver_dir::                The path of the puppetserver config dir
#
# $server_puppetserver_version::            The version of puppetserver 2 installed (or being installed)
#                                           Unfortunately, different versions of puppetserver need configuring differently,
#                                           and there's no easy way of determining which version is being installed.
#                                           Defaults to '2.3.1' but can be overriden if you're installing an older version.
#
# $server_max_active_instances::            Max number of active jruby instances. Defaults to
#                                           processor count
#
# $server_max_requests_per_instance::       Max number of requests a jruby instances will handle. Defaults to 0 (disabled)
#
# $server_idle_timeout::                    How long the server will wait for a response on an existing connection
#
# $server_connect_timeout::                 How long the server will wait for a response to a connection attempt
#
# $server_ssl_protocols::                   Array of SSL protocols to use.
#                                           Defaults to [ 'TLSv1.2' ]
#
# $server_ssl_chain_filepath::              Path to certificate chain for puppetserver
#                                           Only used when $ca is true
#                                           Defaults to "${ssl_dir}/ca/ca_crt.pem"
#
# $server_cipher_suites::                   List of SSL ciphers to use in negotiation
#                                           Defaults to [ 'TLS_RSA_WITH_AES_256_CBC_SHA256', 'TLS_RSA_WITH_AES_256_CBC_SHA',
#                                           'TLS_RSA_WITH_AES_128_CBC_SHA256', 'TLS_RSA_WITH_AES_128_CBC_SHA', ]
#
# $server_ruby_load_paths::                 List of ruby paths
#                                           Defaults based on $::puppetversion
#
# $server_ca_client_whitelist::             The whitelist of client certificates that
#                                           can query the certificate-status endpoint
#                                           Defaults to [ '127.0.0.1', '::1', $::ipaddress ]
#
# $server_admin_api_whitelist::             The whitelist of clients that
#                                           can query the puppet-admin-api endpoint
#                                           Defaults to [ '127.0.0.1', '::1', $::ipaddress ]
#
# $server_enable_ruby_profiler::            Should the puppetserver ruby profiler be enabled?
#                                           Defaults to false
#
# $server_ca_auth_required::                Whether client certificates are needed to access the puppet-admin api
#                                           Defaults to true
#
# $server_use_legacy_auth_conf::            Should the puppetserver use the legacy puppet auth.conf?
#                                           Defaults to false (the puppetserver will use its own conf.d/auth.conf)
#
# $server_check_for_updates::               Should the puppetserver phone home to check for available updates?
#                                           Defaults to true
#
# $server_environment_class_cache_enabled:: Enable environment class cache in conjunction with the use of the
#                                           environment_classes API.
#                                           Defaults to false
#
# $server_allow_header_cert_info::          Enable client authentication over HTTP Headers
#                                           Defaults to false, is also activated by the $server_http setting
#
# $server_web_idle_timeout::                Time in ms that Jetty allows a socket to be idle, after processing has
#                                           completed.
#                                           Defaults to 30000, using the Jetty default of 30s
#
# === Usage:
#
# * Simple usage:
#
#     include puppet
#
# * Installing a puppetmaster
#
#   class {'puppet':
#     server => true,
#   }
#
# * Advanced usage:
#
#   class {'puppet':
#     agent_noop => true,
#     version    => '2.7.20-1',
#   }
#
class puppet (
  String $version = $puppet::params::version,
  String $user = $puppet::params::user,
  String $group = $puppet::params::group,
  Stdlib::Absolutepath $dir = $puppet::params::dir,
  Stdlib::Absolutepath $codedir = $puppet::params::codedir,
  Stdlib::Absolutepath $vardir = $puppet::params::vardir,
  Stdlib::Absolutepath $logdir = $puppet::params::logdir,
  Stdlib::Absolutepath $rundir = $puppet::params::rundir,
  Stdlib::Absolutepath $ssldir = $puppet::params::ssldir,
  Stdlib::Absolutepath $sharedir = $puppet::params::sharedir,
  Variant[Boolean, Enum['server', 'agent']] $manage_packages = $puppet::params::manage_packages,
  Optional[String] $dir_owner = $puppet::params::dir_owner,
  Optional[String] $dir_group = $puppet::params::dir_group,
  Optional[String] $package_provider = $puppet::params::package_provider,
  Optional[Stdlib::Absolutepath] $package_source = $puppet::params::package_source,
  Integer[0, 65535] $port = $puppet::params::port,
  Boolean $listen = $puppet::params::listen,
  Array[String] $listen_to = $puppet::params::listen_to,
  Boolean $pluginsync = $puppet::params::pluginsync,
  Boolean $splay = $puppet::params::splay,
  Pattern[/^\d+[smhdy]?$/] $splaylimit = $puppet::params::splaylimit,
  Variant[Boolean, Stdlib::Absolutepath] $autosign = $puppet::params::autosign,
  Array[String] $autosign_entries = $puppet::params::autosign_entries,
  Pattern[/^[0-9]{3,4}$/] $autosign_mode = $puppet::params::autosign_mode,
  Optional[String] $autosign_content = $puppet::params::autosign_content,
  Optional[String] $autosign_source = $puppet::params::autosign_source,
  Integer[0] $runinterval = $puppet::params::runinterval,
  Boolean $usecacheonfailure = $puppet::params::usecacheonfailure,
  Enum['cron', 'service', 'systemd.timer', 'none'] $runmode = $puppet::params::runmode,
  Array[Enum['cron', 'service', 'systemd.timer', 'none']] $unavailable_runmodes = $puppet::params::unavailable_runmodes,
  Optional[String] $cron_cmd = $puppet::params::cron_cmd,
  Optional[String] $systemd_cmd = $puppet::params::systemd_cmd,
  Boolean $agent_noop = $puppet::params::agent_noop,
  Boolean $show_diff = $puppet::params::show_diff,
  Optional[Stdlib::HTTPUrl] $module_repository = $puppet::params::module_repository,
  Optional[Integer[0]] $configtimeout = $puppet::params::configtimeout,
  Optional[Variant[String, Boolean]] $ca_server = $puppet::params::ca_server,
  Optional[Integer[0, 65535]] $ca_port = $puppet::params::ca_port,
  Optional[String] $ca_crl_filepath = $puppet::params::ca_crl_filepath,
  Optional[String] $prerun_command = $puppet::params::prerun_command,
  Optional[String] $postrun_command = $puppet::params::postrun_command,
  Array[String] $dns_alt_names = $puppet::params::dns_alt_names,
  Boolean $use_srv_records = $puppet::params::use_srv_records,
  Optional[String] $srv_domain = $puppet::params::srv_domain,
  String $pluginsource = $puppet::params::pluginsource,
  String $pluginfactsource = $puppet::params::pluginfactsource,
  Hash[String, Data] $additional_settings = $puppet::params::additional_settings,
  Hash[String, Data] $agent_additional_settings = $puppet::params::agent_additional_settings,
  Optional[String] $agent_restart_command = $puppet::params::agent_restart_command,
  String $classfile = $puppet::params::classfile,
  String $hiera_config = $puppet::params::hiera_config,
  String $main_template = $puppet::params::main_template,
  String $agent_template = $puppet::params::agent_template,
  String $auth_template = $puppet::params::auth_template,
  Boolean $allow_any_crl_auth = $puppet::params::allow_any_crl_auth,
  Array[String] $auth_allowed = $puppet::params::auth_allowed,
  Array[String] $client_package = $puppet::params::client_package,
  Boolean $agent = $puppet::params::agent,
  Boolean $remove_lock = $puppet::params::remove_lock,
  String $client_certname = $puppet::params::client_certname,
  Optional[String] $puppetmaster = $puppet::params::puppetmaster,
  String $systemd_unit_name = $puppet::params::systemd_unit_name,
  String $service_name = $puppet::params::service_name,
  Optional[String] $syslogfacility = $puppet::params::syslogfacility,
  String $environment = $puppet::params::environment,
  Boolean $server = $puppet::params::server,
  Array[String] $server_admin_api_whitelist = $puppet::params::server_admin_api_whitelist,
  String $server_user = $puppet::params::user,
  String $server_group = $puppet::params::group,
  String $server_dir = $puppet::params::dir,
  String $server_ip = $puppet::params::ip,
  Integer $server_port = $puppet::params::port,
  Boolean $server_ca = $puppet::params::server_ca,
  Boolean $server_ca_crl_sync = $puppet::params::server_ca_crl_sync,
  Optional[Boolean] $server_crl_enable = $puppet::params::server_crl_enable,
  Boolean $server_ca_auth_required = $puppet::params::server_ca_auth_required,
  Array[String] $server_ca_client_whitelist = $puppet::params::server_ca_client_whitelist,
  Boolean $server_http = $puppet::params::server_http,
  Integer $server_http_port = $puppet::params::server_http_port,
  Array[String] $server_http_allow = $puppet::params::server_http_allow,
  String $server_reports = $puppet::params::server_reports,
  Enum['master', 'puppetserver'] $server_implementation = $puppet::params::server_implementation,
  Boolean $server_passenger = $puppet::params::server_passenger,
  Optional[Stdlib::Absolutepath] $server_puppetserver_dir = $puppet::params::server_puppetserver_dir,
  Optional[Stdlib::Absolutepath] $server_puppetserver_vardir = $puppet::params::server_puppetserver_vardir,
  Optional[Stdlib::Absolutepath] $server_puppetserver_rundir = $puppet::params::server_puppetserver_rundir,
  Optional[Stdlib::Absolutepath] $server_puppetserver_logdir = $puppet::params::server_puppetserver_logdir,
  Pattern[/^[\d]\.[\d]+\.[\d]+$/] $server_puppetserver_version = $puppet::params::server_puppetserver_version,
  Boolean $server_service_fallback = $puppet::params::server_service_fallback,
  Integer[0] $server_passenger_min_instances = $puppet::params::server_passenger_min_instances,
  Boolean $server_passenger_pre_start = $puppet::params::server_passenger_pre_start,
  Optional[String] $server_passenger_ruby = $puppet::params::server_passenger_ruby,
  String $server_httpd_service = $puppet::params::server_httpd_service,
  Variant[Undef, String[0], Stdlib::Absolutepath] $server_external_nodes = $puppet::params::server_external_nodes,
  String $server_template = $puppet::params::server_template,
  String $server_main_template = $puppet::params::server_main_template,
  Array[String] $server_cipher_suites = $puppet::params::server_cipher_suites,
  Optional[String] $server_config_version = $puppet::params::server_config_version,
  Integer[0] $server_connect_timeout = $puppet::params::server_connect_timeout,
  Boolean $server_git_repo = $puppet::params::server_git_repo,
  Boolean $server_dynamic_environments = $puppet::params::server_dynamic_environments,
  Boolean $server_directory_environments = $puppet::params::server_directory_environments,
  Boolean $server_default_manifest = $puppet::params::server_default_manifest,
  Stdlib::Absolutepath $server_default_manifest_path = $puppet::params::server_default_manifest_path,
  String $server_default_manifest_content = $puppet::params::server_default_manifest_content,
  Boolean $server_enable_ruby_profiler = $puppet::params::server_enable_ruby_profiler,
  Array[String] $server_environments = $puppet::params::server_environments,
  String $server_environments_owner = $puppet::params::server_environments_owner,
  Optional[String] $server_environments_group = $puppet::params::server_environments_group,
  Pattern[/^[0-9]{3,4}$/] $server_environments_mode = $puppet::params::server_environments_mode,
  Stdlib::Absolutepath $server_envs_dir = $puppet::params::server_envs_dir,
  Optional[Stdlib::Absolutepath] $server_envs_target = $puppet::params::server_envs_target,
  Variant[Undef, String[0], Array[Stdlib::Absolutepath]] $server_common_modules_path = $puppet::params::server_common_modules_path,
  Pattern[/^[0-9]{3,4}$/] $server_git_repo_mode = $puppet::params::server_git_repo_mode,
  Stdlib::Absolutepath $server_git_repo_path = $puppet::params::server_git_repo_path,
  String $server_git_repo_group = $puppet::params::server_git_repo_group,
  String $server_git_repo_user = $puppet::params::server_git_repo_user,
  Hash[String, String] $server_git_branch_map = $puppet::params::server_git_branch_map,
  Integer[0] $server_idle_timeout = $puppet::params::server_idle_timeout,
  String $server_post_hook_content = $puppet::params::server_post_hook_content,
  String $server_post_hook_name = $puppet::params::server_post_hook_name,
  Variant[Undef, Boolean, Enum['active_record', 'puppetdb']] $server_storeconfigs_backend = $puppet::params::server_storeconfigs_backend,
  Stdlib::Absolutepath $server_app_root = $puppet::params::server_app_root,
  Array[Stdlib::Absolutepath] $server_ruby_load_paths = $puppet::params::server_ruby_load_paths,
  Stdlib::Absolutepath $server_ssl_dir = $puppet::params::server_ssl_dir,
  Boolean $server_ssl_dir_manage = $puppet::params::server_ssl_dir_manage,
  Boolean $server_ssl_key_manage = $puppet::params::server_ssl_key_manage,
  Array[String] $server_ssl_protocols = $puppet::params::server_ssl_protocols,
  Optional[Stdlib::Absolutepath] $server_ssl_chain_filepath = $puppet::params::server_ssl_chain_filepath,
  Optional[Variant[String, Array[String]]] $server_package = $puppet::params::server_package,
  Optional[String] $server_version = $puppet::params::server_version,
  String $server_certname = $puppet::params::server_certname,
  Enum['v2'] $server_enc_api = $puppet::params::server_enc_api,
  Enum['v2'] $server_report_api = $puppet::params::server_report_api,
  Integer[0] $server_request_timeout = $puppet::params::server_request_timeout,
  Optional[String] $server_ca_proxy = $puppet::params::server_ca_proxy,
  Boolean $server_strict_variables = $puppet::params::server_strict_variables,
  Hash[String, Data] $server_additional_settings = $puppet::params::server_additional_settings,
  Array[String] $server_rack_arguments = $puppet::params::server_rack_arguments,
  Boolean $server_foreman = $puppet::params::server_foreman,
  Stdlib::HTTPUrl $server_foreman_url = $puppet::params::server_foreman_url,
  Optional[Stdlib::Absolutepath] $server_foreman_ssl_ca = $puppet::params::server_foreman_ssl_ca,
  Optional[Stdlib::Absolutepath] $server_foreman_ssl_cert = $puppet::params::server_foreman_ssl_cert,
  Optional[Stdlib::Absolutepath] $server_foreman_ssl_key = $puppet::params::server_foreman_ssl_key,
  Boolean $server_foreman_facts = $puppet::params::server_foreman_facts,
  Optional[Stdlib::Absolutepath] $server_puppet_basedir = $puppet::params::server_puppet_basedir,
  Optional[String] $server_puppetdb_host = $puppet::params::server_puppetdb_host,
  Integer[0, 65535] $server_puppetdb_port = $puppet::params::server_puppetdb_port,
  Boolean $server_puppetdb_swf = $puppet::params::server_puppetdb_swf,
  Enum['current', 'future'] $server_parser = $puppet::params::server_parser,
  Variant[Undef, Enum['unlimited'], Pattern[/^\d+[smhdy]?$/]] $server_environment_timeout = $puppet::params::server_environment_timeout,
  String $server_jvm_java_bin = $puppet::params::server_jvm_java_bin,
  String $server_jvm_config = $puppet::params::server_jvm_config,
  Pattern[/^[0-9]+[kKmMgG]$/] $server_jvm_min_heap_size = $puppet::params::server_jvm_min_heap_size,
  Pattern[/^[0-9]+[kKmMgG]$/] $server_jvm_max_heap_size = $puppet::params::server_jvm_max_heap_size,
  String $server_jvm_extra_args = $puppet::params::server_jvm_extra_args,
  Optional[Stdlib::Absolutepath] $server_jruby_gem_home = $puppet::params::server_jruby_gem_home,
  Integer[1] $server_max_active_instances = $puppet::params::server_max_active_instances,
  Integer[0] $server_max_requests_per_instance = $puppet::params::server_max_requests_per_instance,
  Boolean $server_use_legacy_auth_conf = $puppet::params::server_use_legacy_auth_conf,
  Boolean $server_check_for_updates = $puppet::params::server_check_for_updates,
  Boolean $server_environment_class_cache_enabled = $puppet::params::server_environment_class_cache_enabled,
  Boolean $server_allow_header_cert_info = $puppet::params::server_allow_header_cert_info,
  Integer[0] $server_web_idle_timeout = $puppet::params::server_web_idle_timeout,
) inherits puppet::params {
  include ::puppet::config
  Class['puppet::config'] -> Class['puppet']

  if $agent == true {
    include ::puppet::agent
    Class['puppet::agent'] -> Class['puppet']
  }

  if $server == true {
    include ::puppet::server
    Class['puppet::server'] -> Class['puppet']
  }

  # Ensure the server is running before the agent needs it, and that
  # certificates are generated in the server config (if enabled)
  if $server == true and $agent == true {
    Class['puppet::server'] -> Class['puppet::agent::service']
  }
}
