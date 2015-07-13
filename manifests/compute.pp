class appformix::compute (
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
    $source = "${source_dir}/appformix-manager_${version}_all.${extension}"
  }
  package { 'appformix-manager':
    ensure   => $package_ensure,
    provider => $provider,
    source   => $source,
  }
}
