obj-m += pubsub.o
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	sudo dmesg --clear
	sudo insmod pubsub.ko
	clear
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
	sudo rmmod pubsub
publisher:
	gcc -pthread Publisher.c -o Publisher && valgrind ./Publisher
subscriber:
	gcc -pthread Subscriber.c -o Subscriber && valgrind ./Subscriber