init: frontend/node_modules backend/node_modules
	@echo "All done."

frontend:
	git clone https://github.com/testing-lab/frontend.git frontend

backend:
	git clone https://github.com/testing-lab/backend.git backend

backend/node_modules: backend
	cd backend && npm install

frontend/node_modules: frontend
	cd frontend && npm install

BACKEND_FILES_OUT = $(patsubst %,dist/%, $(shell find backend/server backend/lib backend/config -type f -name '*'))
FRONTEND_FILES_OUT = $(patsubst frontend/dist/%,dist/frontend/%, $(shell find frontend/dist -type f -name '*'))

dist: $(BACKEND_FILES_OUT) $(FRONTEND_FILES_OUT) dist/backend/node_modules
	# do deploy here
	@echo > /dev/null

dist/backend/%: backend/% 
	@mkdir -p $(@D)
	@cp $< $@

dist/backend/node_modules:
	@mkdir -p dist
	@mkdir -p dist/backend
	@rsync -ra --exclude=.git backend/node_modules dist/backend/node_modules

dist/frontend/%: frontend/dist/% build_frontend
	@mkdir -p $(@D)
	@cp $< $@

build_frontend:
	@cd frontend && grunt build

clean:
	@rm -rf dist

fullclean: clean
	rm -rf frontend backend

.PHONY: clean fullclean init dist/backend/node_modules build_frontend