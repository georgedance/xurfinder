##############################
#        project info        #
##############################

NAME = xurfinder
DESC = let's find xur
AUTH = George Dance
DATE = 24/01
YEAR = 2024

####################################################
#        stuff you probably shouldn't tweak        #
####################################################

BIN := bin/$(NAME)
SRC := src/$(NAME).py

####################################
#        generic make rules        #
####################################

$(BIN): folders
	@cp -v $(SRC) $(BIN)
	@chmod +x $(BIN)

####################################
#        utility make rules        #
####################################
.PHONY: init folders tidy tags readme

init: allfolders readme
	@ \
	if [ -e src/*.py ]; then printf ''; \
	else \
	printf 'print("Kia Ora!")\n' >> src/$(NAME).py && \
	echo project initialised; fi

folders:
	@mkdir -pv src bin

tidy:
	@rm -vf tags
	@if [ -d bin ]; then rmdir --ignore-fail-on-non-empty bin; fi
	@if [ -d src ]; then rmdir --ignore-fail-on-non-empty src; fi
	@if [ -e README.md ] && [ `wc -l README.md | cut -d" " -f1` -lt 3 ]; then rm -vf README.md; fi

tags:
	@ctags -R .

readme:
	@ \
	if [ -e README.md ]; then echo README.md already exists; \
		else printf "# $(NAME)\n### $(DESC)\n" >> README.md && \
		echo README.md created; fi

#################################
#        user make rules        #
#################################
.PHONY: all build run clean install uninstall run help

all: release

release: $(BIN)

clean: tidy
	@rm -vf $(BIN)

install: release
	cp $(BIN) /usr/local/bin/$(NAME)
	@echo installed

uninstall:
	rm -v /usr/local/bin/$(NAME)
	@echo uninstalled

run: release
	python $(SRC)

help:
	@echo here are all of the commands in this Makefile:
	@grep '\.PHONY:\ ' Makefile 2> /dev/null | cut -d' ' -f2- | xargs | tr ' ' '\n' | uniq -u | sort

################################################################################

