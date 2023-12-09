
# commands for testing the renering of the profile page before pushing it to github

venv:|
	python3 -m venv venv && \
	. venv/bin/activate && \
	pip install git+https://github.com/joeyespo/grip.git

# render the profile page
render: white dark

white:
	. venv/bin/activate && \
	grip profile/. 6418 &

dark:
	. venv/bin/activate && \
	grip profile/. 6419 --theme dark &


# kill the grip server
stop:
	killall grip