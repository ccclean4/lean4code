# AGENTS.md

This is a Lean4 learning repository containing math proofs and example files.

## Running Files

```bash
lean <file>.lean    # Check a single file
```

## Tests

```bash
cd examples && ./test.sh           # Run all example files
cd examples/basic && ./test.sh     # Run basic examples only
cd examples/math && ./test.sh     # Run math examples only
```

## Structure

- `examples/basic/` - Basic Lean4 tutorials
- `examples/math/` - Math examples
- `math/` - Math library (algebra, calculus, logic, geometry, etc.)
- `book/` - Generated书本 AI-generated book content

## Notes

- No build system or package manager (lakefile.toml, leanpkg.toml) - just standalone `.lean` files
- No CI workflows configured
- Tests are simple shell scripts that run `lean` on each file individually