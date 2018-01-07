GIT_COMMIT := $(shell echo "`git rev-parse --short HEAD``git diff-index --quiet HEAD -- || echo '-dirty'`")

all: out/rndis-$(GIT_COMMIT).hmod

out/rndis-$(GIT_COMMIT).hmod:
	mkdir -p out/
	chmod +x "mod/etc/init.d/S92rndis"
	[ -f "out/rndis-$(GIT_COMMIT).hmod" ] || tar -czvf "out/rndis-$(GIT_COMMIT).hmod" -C mod/ etc

clean: clean-hmod

clean-hmod:
	-rm -rf "out/"

.PHONY: clean clean-hmod