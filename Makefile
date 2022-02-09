install:
	bundle instal

test:
	bundle exec rake test

lint:
	bundle exec rubocop

.PHONY: test
