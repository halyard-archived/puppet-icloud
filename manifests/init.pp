# == Class: icloud
#
# Configure iCloud options
#
class icloud (
) {
  boxen::osx_defaults { 'Disable photo stream':
    user   => $::boxen_user,
    domain => 'com.apple.CloudPhotosConfiguration',
    key    => 'com.apple.photo.icloud.myphotostream',
    value  => 0,
    type   => 'integer'
  }

  boxen::osx_defaults { 'Disable shared streams':
    user   => $::boxen_user,
    domain => 'com.apple.CloudPhotosConfiguration',
    key    => 'com.apple.photo.icloud.sharedstreams',
    value  => 0,
    type   => 'integer'
  }

  boxen::osx_defaults { 'Disable cloud photo':
    user   => $::boxen_user,
    domain => 'com.apple.CloudPhotosConfiguration',
    key    => 'com.apple.photo.icloud.cloudphoto',
    value  => 0,
    type   => 'integer'
  }
}
