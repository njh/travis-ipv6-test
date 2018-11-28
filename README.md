Travis CI IPv6 Tests
====================

I was trying to test some software that supports IPv6 and I was 
disappointed to discover that my test was failing in Travis.

After Googling, I found that a number of the Travis build environments 
don't support IPv6 but I couldn't find some definitive answers.

The different types of build environment are listed here:
https://docs.travis-ci.com/user/reference/overview/

Check status
------------

See the latest build at
https://travis-ci.org/njh/travis-ipv6-test

You can always fork the repo and rerun the test on your fork to get an updated status.

Interpreting test results
-------------------------

* If a job is successful, this means that in the corresponding configuration,
IPv6 is present and works at least for the loopback interface, for TCP and UDP.

To get more details, examine the `ifconfig` output in the build log:

* The line `inet6 ::1 prefixlen 128` is the loopback address.
  It means IPv6 is enabled for the loopback interface and you can use the `::1`
  address for local tests or whatever.

* A line like `inet6 fe80::<etc>` shows a
  [link-only address](https://en.wikipedia.org/wiki/Link-local_address#IPv6)
  for an interface.
  If it's present, it means that IPv6 is enabled for the corresponding interface.

* If there's another `inet6` line for an interface with an address unlike any
  of the above, it means the corresponding interface also has a global IPv6 address
  (none do as of this writing, but this will hopefully change in the future.)
