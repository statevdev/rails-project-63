.PHONY: install

install:
	bundle install
lint:
	bundle exec rubocop .
testing:
	bundle exec rake test
