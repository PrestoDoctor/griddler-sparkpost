Griddler::Sparkpost
==================

This is an adapter that allows [Griddler](https://github.com/thoughtbot/griddler) to be used with
[SparkPost's Inbound Email Relay].

[SparkPost's Inbound Email Relay]: https://support.sparkpost.com/customer/portal/articles/2039614-enabling-inbound-email-relaying-relay-webhooks

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'griddler'
gem 'griddler-sparkpost'
```

Usage
-----

[thoughtbot](http://thoughtbot.com) has a blog post on how to use Griddler over on their blog: [Giant
Robots](https://robots.thoughtbot.com/griddler-is-better-than-ever).

That post is specific to Mailgun, so you'll need to update the references from Mailgun to SparkPost.

Example:

```ruby
# config/initializers/griddler.rb

Griddler.configure do |config|
  config.email_service = :sparkpost
end
```

More Information
----------------

* [SparkPost](https://www.sparkpost.com/)
* [SparkPost's Inbound Email Relay](https://support.sparkpost.com/customer/portal/articles/2039614-enabling-inbound-email-relaying-relay-webhooks)

Credits
-------

Griddler::Sparkpost is based off of [Griddler::Sendgrid](https://github.com/thoughtbot/griddler-sendgrid) by Caleb Thompson.

Griddler was written by Caleb Thompson and Joel Oliveira.

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

The names and logos for thoughtbot are trademarks of thoughtbot, inc.

License
-------

Griddler is Copyright © 2014 Caleb Thompson, Joel Oliveira and thoughtbot. It is
free software, and may be redistributed under the terms specified in the LICENSE
file.

Griddler::Sparkpost is Copyright © 2016 Kyle Powers and PrestoDoctor. It is free
software, and may be redistributed under the terms specified in the LICENSE
file.
