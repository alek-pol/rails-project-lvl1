install:
	bundle install

test:
	bundle exec rake test

lint:
	bundle exec rake rubocop

doc:
	yardoc 'lib/**/*.rb'

.PHONY: test
