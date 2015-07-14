class appformix::controller (
  $package_ensure = 'present',
  $source_dir     = false,
  $version        = undef,
) {
  include  ::appformix::params
  if $source_dir {
    if ! $version {
      fail('version parameter is required with source_dir')
    }
    $extension = $appformix::params::extension
    $provider = $appformix::params::provider
    $controller_source = "${source_dir}/appformix-controller_${version}_all.${extension}"
    $datamanager_source = "${source_dir}/appformix-datamanager_${version}_all.${extension}"
    $dashboard_source = "${source_dir}/appformix-dashboard_${version}_all.${extension}"
    $openstack_plugin_source = "${source_dir}/appformix-openstack-plugin_${version}_all.${extension}"
  }
  package { 'appformix-controller':
    ensure   => $package_ensure,
    provider => $provider,
    source   => $controller_source,
  }
  package { 'appformix-datamanager':
    ensure   => $package_ensure,
    provider => $provider,
    source   => $datamanager_source,
  }
  package { 'appformix-dashboard':
    ensure   => $package_ensure,
    provider => $provider,
    source   => $dashboard_source,
  }
  package { 'appformix-openstack_plugin':
    ensure   => $package_ensure,
    provider => $provider,
    source   => $openstack_plugin_source,
  }
}
