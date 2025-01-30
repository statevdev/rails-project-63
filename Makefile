.PHONY: install

install:
	bundle install
lint:
	bundle exec rubocop .
testing:
	rake test
