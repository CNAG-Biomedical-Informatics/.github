
# commands for testing the renering of the profile page before pushing it to github

venv:|
	python3 -m venv venv && \
	. venv/bin/activate && \
	pip install grip

render:
	. venv/bin/activate && \
	cd profile && \
	grip