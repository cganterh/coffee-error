file_name = error
coffee_file = $(file_name).coffee
js_file = $(file_name).js
test_file = test.html

bower_components = bower_components
coffee_path = $(bower_components)/coffee-script
jasmine_path = $(bower_components)/jasmine-core
coffee = $(coffee_path)/bin/coffee

.DEFAULT_GOAL = $(js_file)

$(coffee_path) $(jasmine_path):
	bower install

$(js_file): $(coffee_file) $(coffee_path)
	$(coffee) -cs <$< >$@

.PHONY: test
test: $(js_file) $(jasmine_path) $(coffee_path)
	xdg-open $(test_file)

.PHONY: clean
clean:
	rm -rf $(js_file) $(bower_components)
