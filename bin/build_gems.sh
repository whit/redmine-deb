#! /bin/sh

set -x
set -eu

gem_install() {
	gem install -i $GEM_PATH --no-ri --no-rdoc $1 -v $2
}

main() {
	cd build
	mkdir gems
	GEM_PATH="$PWD/gems"
	export GEM_PATH

	gem install -i $GEM_PATH --no-ri --no-rdoc bundler

	$GEM_PATH/bin/bundle install --gemfile=./redmine-2.0.2/Gemfile --path=$GEM_PATH --without development test mysql sqlite rmagick postgresql
}

main

