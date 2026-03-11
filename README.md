# att2intel

A Python command-line tool that converts x86/x86-64 GNU assembly (`.s`) files from **AT&T syntax** to **Intel syntax** (GAS `.intel_syntax noprefix` style).

## What It Does

AT&T and Intel are two different syntaxes for writing x86 assembly. They differ in operand order, register/immediate prefixes, and memory operand formatting. This script automates the conversion so you don't have to rewrite files by hand.

### Conversions performed

| Feature | AT&T (input) | Intel (output) |
|---|---|---|
| Register prefixes | `%rax`, `%eax` | `rax`, `eax` |
| Immediate prefixes | `$42`, `$0xff` | `42`, `0xff` |
| Operand order | `mov %rax, %rbx` (src, dst) | `mov rbx, rax` (dst, src) |
| Memory operands | `disp(%base, %index, scale)` | `[base + index*scale + disp]` |
| Size suffixes | `movl`, `addq`, `cmpb` | `mov DWORD PTR`, `add`, `cmp BYTE PTR` |
| Sign-extend mnemonics | `cltq`, `cwtl`, `cbtw` | `cdqe`, `cwde`, `cbw` |
| Move sign/zero extend | `movzbl`, `movswq` | `movzx BYTE PTR`, `movsx WORD PTR` |
| `movsxd` for 32→64 | `movslq` | `movsxd DWORD PTR` |
| Segment overrides | `%fs:0x28(%rbp)` | `fs:[rbp + 0x28]` |
| RIP-relative | `symbol(%rip)` | `[rip + symbol]` |
| Indirect calls/jumps | `*%rax`, `*(%rax)` | `rax`, `[rax]` |
| `movabs` | `movabsq $imm, %rax` | `mov rax, imm` |
| `lock` / `rep` prefixes | preserved | preserved |
| Labels and directives | passed through unchanged | passed through unchanged |
| Comments (`#`) | preserved | preserved |

A `.intel_syntax noprefix` directive is prepended to every output file.

## Requirements

- Python 3.6+
- No external dependencies (stdlib only)

## Usage

```
python3 att2intel.py <source_directory> [output_directory]
```

- **`<source_directory>`** — Directory containing `.s` assembly files (searched recursively).
- **`[output_directory]`** — (Optional) Where converted files are written. Defaults to `code_intel_gas/` in the current working directory.

### Examples

Convert all `.s` files under `src/asm/` and write results to the default `code_intel_gas/` directory:

```bash
python3 att2intel.py src/asm/
```

Specify a custom output directory:

```bash
python3 att2intel.py src/asm/ output/intel/
```

Output:

```
converted src/asm/boot.s -> output/intel/boot.s
converted src/asm/syscall.s -> output/intel/syscall.s
```

## How It Works

1. Recursively finds all `.s` files in the source directory.
2. For each file, processes every line:
   - **Blank lines, labels, and assembler directives** (lines starting with `.`) are passed through unchanged.
   - **Instructions** are parsed into opcode + operands, then:
     - The AT&T size suffix (b/w/l/q) is stripped and converted to an Intel `PTR` qualifier when needed.
     - Special mnemonics (sign-extension, `movzx`/`movsx`, `cmov`, `ret` variants) are translated.
     - Operands are converted (prefixes removed, memory reformatted, immediates cleaned up).
     - Operand order is reversed (AT&T is src, dst → Intel is dst, src).
   - **Comments** are preserved at the end of each line.
3. Writes the converted text to the output directory with `.intel_syntax noprefix` prepended.

## Limitations

- Only processes `.s` files; `.S` (capital) files with C preprocessor directives may need separate handling.
- Inline assembly in C/C++ source files is not supported.
- Some rare or privileged instructions may not have explicit suffix-stripping rules and will pass through as-is.
