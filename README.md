#Jammed [![Build History][2]][1] [![Dependency Status][4]][3]

###A Ruby API wrapper for [This Is My Jam](http://www.thisismyjam.com/).

Note: The API for This Is My Jam is stil in beta, so if you'd like to use it please email the Jam team at api@thisismyjam.com to get on their mailing list.

## Installation

Add this line to your application's Gemfile:

    gem 'jammed'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jammed

## Usage

Note: Right now, since the API is in beta, `Jammed.new` can be called without supplying an API key (it defaults to the beta key). Once individual dev keys are available this will change.

```ruby
require 'jammed'

jammed = Jammed.new('987bcab01b929eb2c07877b224215c92')

pop_jams = jammed.popular_jams

iftfom_profile = jammed.profile('IFTFOM')
iftfom_likes = jammed.likes('IFTFOM', :show => :current)

iftfom = jammed.user('IFTFOM')
iftfom.profile # same as jammed.profile('IFTFOM')
iftfom.likes(:show => :current) # same as jammed.likes('IFTFOM', :show => :current)
iftfom.likes! #resets cached likes and return all of IFTFOM's like
```

Also, pagination is not supported at the moment. So, at most you will get the first 60 results for any API call that returns a list. Automatically handling pagination is a first priority for the next release.

## Links

* [This Is My Jam](http://www.thisismyjam.com/)
* [This Is My Jam API Documentation](http://www.thisismyjam.com/developers/beta)
* [This Is My Jam API Google Group](https://groups.google.com/forum/?fromgroups#!forum/thisismyapi)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[1]: http://travis-ci.org/seanslerner/Jammed
[2]: https://secure.travis-ci.org/seanslerner/Jammed.png?branch=master
[3]: https://gemnasium.com/seanslerner/jammed
[4]: https://gemnasium.com/seanslerner/Jammed.png
