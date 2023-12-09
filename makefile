
# commands for testing the renering of the profile page 
# before pushing it to github

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

# commands for getting the icons
make icons: dl-icons recolor-icons

dl-icons:|
	url=https://raw.githubusercontent.com/FortAwesome/Font-Awesome/6.x/svgs && \
	cd profile/icons && \
	wget -O flask.svg $$url/solid/flask.svg && \
	wget -O book.svg $$url/solid/book.svg && \
	wget -O github.svg $$url/brands/github.svg

recolor-icons:|
	NEW_COLOR=#808080 && \
	cd profile/icons && \
	sed -i "s/<path /<path fill=\"$$NEW_COLOR\" /g" *.svg