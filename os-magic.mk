ifeq ($(OS),Windows_NT)
	ARCH = $(PROCESSOR_ARCHITECTURE)
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OS=Linux
	endif
	ifeq ($(UNAME_S),Darwin)
		OS=MacOS
	endif

	UNAME_P := $(shell uname -p)
	ifeq ($(UNAME_P),x86_64)
		ARCH=x86_64
	endif
		ifneq ($(filter %86,$(UNAME_P)),)
		ARCH=x86_64
		endif
	ifneq ($(filter arm%,$(UNAME_P)),)
		ARCH=arm
	endif
endif