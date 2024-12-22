ifneq ($(KERNELRELEASE),)
ccflags-y += -DDEBUG
# kbuild part of makefile
obj-m   := hello.o
else
# normal makefile
KDIR ?= /lib/modules/`uname -r`/build

default:
	$(MAKE) -C $(KDIR) M=$$PWD
clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
endif
