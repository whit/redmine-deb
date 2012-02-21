#! /bin/sh

set -x
set -eu

gem_install() {
	gem install -i $GEM_PATH --no-ri --no-rdoc $1 -v $2
}

main() {
	cd build
	mkdir gems
	GEM_PATH="./gems"
	export GEM_PATH

	gem_install rails 2.3.11
	gem_install i18n 0.4.2
	gem_install unicorn 4.1.1
}

main
