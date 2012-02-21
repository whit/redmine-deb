#! /usr/bin/env sh

set -x
set -eu

archive=redmine-1.2.2.tar.gz

fetch_cache() {
	CACHE_DIR=${CACHE_DIR:-$HOME/redmine-dev-cache}

	test -d $CACHE_DIR && test -f $CACHE_DIR/$archive && cp $CACHE_DIR/$archive ./
}

fetch_website() {
	url=http://rubyforge.org/frs/download.php/75518/$archive
	wget $url
}

main() {
	cd build
	fetch_cache || fetch_website
	tar -zxf $archive
}

main
