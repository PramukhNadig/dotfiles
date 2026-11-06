# Competitive programming setup

Tooling lives in `~/cp` (on your PATH via `~/.zshrc`). Problem folders live here in `~/compprog`.

## Commands
| Command | What it does |
|---|---|
| `new name` | Create `name.py` from `~/cp/template.py` and open it in nvim. `new name cpp` for C++. |
| `r file.py [input]` | Run with `pypy3` (`PY=python3 r ...` for CPython). With an input file it is fed as stdin and `LOCAL` is passed, so `dbg()` prints to stderr. |
| `r file.cpp [input]` | Compile with clang (`-O2`, warnings, ASan/UBSan, `-DLOCAL`) and run. |
| `stress sol brute gen.py` | Run `gen.py <seed>` repeatedly, compare `sol` vs `brute` (`.py` or `.cpp`). First mismatch is saved to `fail.in`. `N=5000` sets the run count (default 1000). |
| `oj d <url>` | Download sample tests (online-judge-tools). `oj t -c "pypy3 a.py"` tests them. |

## Neovim
`<F5>` saves the current file and runs it in a bottom terminal split, using `input.txt` from the same directory if it exists. Defined in `~/.config/nvim/lua/config/keymaps.lua`.

## Templates
- `~/cp/template.py`: fast input, common imports, `solve()` per test case.
- `~/cp/template.cpp`: fast IO, `dbg(x)` macro (prints only with `-DLOCAL`).
- `~/cp/include/bits/stdc++.h`: shim so `#include <bits/stdc++.h>` works with Apple clang.

## Notes
- Homebrew GCC 16 does not work with the macOS 26 SDK, so C++ uses Apple clang.
- Open a new shell (or `source ~/.zshrc`) for the PATH change to take effect.
