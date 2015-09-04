## Gutter - Linux-Ruby DashBoard

[![Join the chat at https://gitter.im/rajeevkannav/gutter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/rajeevkannav/gutter?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

A low-overhead monitoring web dashboard for a GNU/Linux machine. Simply drop-in the app and go!

[**View Features**](#features) | [**Installation Instructions**](#installation) | [**Support**](#support) | [**Contributing**](#contributing)

## Features
* A beautiful web-based dashboard for monitoring server info
* Live, on-demand monitoring of RAM, Load, Uptime, Disk Allocation, Users and many more system stats
* Drop-in install for servers with Apache2/nginx + Ruby
* Click and drag to re-arrange widgets
* Support for wide range of linux server flavors [(See Support section)](#support)

## Installation

1. add to your `Gemfile` ->  `'gutter'`.
2. add this line to routes `mount Gutter::Engine => "/gutter"`
3. bundle install.
4. `rails s`
5. checkout `http://localhost:3000/gutter`


## Support

*The information listed here is currently limited and will expand shortly.*

* OS
    * Arch
    * Debian 6, 7
    * Ubuntu 11.04+
    * Linux Mint 16+
* Apache 2
* Nginx
* Ruby
* Modern browsers

## Contributing

We hope that you will consider contributing to gutter. You can contribute in many ways. For example, you might:

add documentation and “how-to” articles to the README or Wiki.

improve the existing application with more system specific features in gutter.

When contributing to gutter, we ask that you:

provide tests and documentation whenever possible. It is very unlikely that we will accept new features or functionality into Devise without the proper testing and documentation. When fixing a bug, provide a failing test case that your patch solves.

open a GitHub Pull Request with your patches and we will review your contribution and respond as quickly as possible. Keep in mind that this is an open source project, and it may take us some time to get back to you. Your patience is very much appreciated.

Soon you'll be listed here:
* [gutter-people](https://github.com/rajeevkannav/gutter/graphs/contributors)

## Credits:
* [linux-dash](https://github.com/afaqurk/linux-dash) - [afaqurk](https://github.com/afaqurk/) Thank-you so much!
* [Dashboard Template](http://www.egrappler.com/templatevamp-free-twitter-bootstrap-admin-template/)
* [Bootstrap](http://getbootstrap.com)
* [Font Awesome](http://fontawesome.io/)

This project rocks and uses MIT-LICENSE.
