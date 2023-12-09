
# commands for testing the renering of the profile page before pushing it to github

include .env

venv:|
	python3 -m venv venv && \
	. venv/bin/activate && \
	pip install git+https://github.com/joeyespo/grip.git

# render the profile page
render: white dark

white:
	. venv/bin/activate && \
	grip profile/. 6418 --user ${GITHUB_USER} --pass ${GITHUB_TOKEN}  &

dark:
	. venv/bin/activate && \
	grip profile/. 6419 --theme dark --user ${GITHUB_USER} --pass ${GITHUB_TOKEN} &


# kill the grip server
stop:
	killall grip