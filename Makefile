all : cexec perlexec py3exec
	@echo "all done"

rustlib : src/lib.rs
	@cargo build

cbuild : rustlib src/libtest.c
	@echo Build C binary
	@clang -L./target/debug -llibrst1 -o libtest1 src/libtest.c

cexec : cbuild
	@echo Running C code
	@./libtest1

perlbuild : src/libtest.pl rustlib
	@echo "Installing FFI::Raw with cpanm"
	@cpanm FFI::Raw

perlexec : perlbuild
	@echo Running Perl code
	@perl src/libtest.pl

py3exec : rustlib
	@echo "Running Python 3 code (make sure python3 is installed)"
	@python3 src/libtest.py

clean :
	@cargo clean
	@rm -f libtest1
