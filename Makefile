all : cexec
	@echo "done"

rustlib : src/lib.rs
	@cargo build

cexec : rustlib src/libtest.c
	@clang -L./target/debug -llibrst1 -o libtest1 src/libtest.c

clean :
	@cargo clean
	@rm -f libtest1
