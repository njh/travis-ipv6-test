Travis CI IPv6 Tests
====================

I was trying to test some software that supports IPv6 and I was 
disappointed to discover that my test was failing in Travis.

After Googling, I found that a number of the Travis build environments 
don't support IPv6 but I couldn't find some definitive answers.

The different types of build environment are listed here:
https://docs.travis-ci.com/user/reference/overview/

You can see the results of the tests here:
https://travis-ci.org/njh/travis-ipv6-test

My findings are summarised below.


Address Allocation
------------------

First I checked if the network interfaces had IPv6 addresses allocated:

| Build Environment                  | IPv6 Loopback | IPv6 Link Local | IPv6 Global |
|------------------------------------|---------------|-----------------|-------------|
| Trusty VM         (sudo: required) | No            | No              | No          |
| Trusty Container  (sudo: false)    | Yes           | Yes             | No          |
| Precise VM        (sudo: required) | No            | No              | No          |
| Precise Container (sudo: false)    | Yes           | Yes             | No          |
| Mac OS X                           | Yes           | Yes             | No          |


Web Server Test
---------------

Binding a web server to IPv6 localhost works for containers (`sudo: false`) and Mac OS X.
It fails for the Linux VMs (`sudo: required`).


UDP Socket Test
---------------

Sending a UDP packet to IPv6 localhost works for containers (`sudo: false`) and Mac OS X.
It fails for the Linux VMs (`sudo: required`).

