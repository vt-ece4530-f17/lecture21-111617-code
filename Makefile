TARGET = bugme
CROSS_COMPILE = arm-linux-gnueabihf-
CROSS_CFLAGS = -g -O3 -Wall \
                -pg
CROSS_LDFLAGS = -g -Wall
CROSS_CC = $(CROSS_COMPILE)gcc
CROSS_OBJDUMP= $(CROSS_COMPILE)objdump
CROSS_SIZE= $(CROSS_COMPILE)size
FUNC_CC = gcc -lm -pg

build: $(TARGET)

$(TARGET): bugme.c
	$(CROSS_CC) $(CROSS_CFLAGS) $(CROSS_LDFLAGS) $^ -o $@
	$(CROSS_OBJDUMP) -D $(TARGET) > $(TARGET).lst
	$(CROSS_SIZE) $(TARGET)
	$(FUNC_CC) $^ -o $(TARGET)_x86

%.o : %.c
	$(CROSS_CC) $(CROSS_CFLAGS) -c $< -o $@

.PHONY: clean

clean:
	rm -f $(TARGET) $(TARGET)_x86 $(TARGET).lst \
		wave*.txt *.a *.o *~ access access.lst gmon.out
