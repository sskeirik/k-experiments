# shared rules

# this is our backend dependent primary build directory
build_dir = .build/$(backend)

# phony build rule calls backend dependent build rule
.PHONY: build clean
build: .build/$(backend)/$(main_file_name)-kompiled/compiled.txt
clean:
	rm -r .build

# main build rule
.build/$(backend)/$(main_file_name)-kompiled/compiled.txt: $(shell find ./src)
	@mkdir -p $(build_dir)
	kompile -d $(build_dir) --backend $(backend) $(kompile_opts) src/$(main_file)

# test runner rules depend on test file + selected backend
tests/haskell/%.test.run: backend = haskell
tests/llvm/%.test.run:    backend = llvm
tests/%.test.run: tests/%.test .build/$(backend)/$(main_file_name)-kompiled/compiled.txt
	kx -d $(build_dir) $<

# spec rules depend on the haskell backend by default
specs/%.spec.run: backend = haskell
specs/%.spec.run: specs/%.spec $(build_target)
	kprove -d $(build_dir) -m $(def_module) $<
