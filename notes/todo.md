# todo

Convert this file to .md from .norg format.

## nvim

### Create Journal: Today and Journal: Last commands
Basically same as what the Neorg commands did. But with last, open the last one instead of yesterday, because work weeks.

### treesitter context should include any scope, specifically lambdas
   I was in the body of a lambda being passed to std::thread constructor and it would
   be  nice to see that context.

### `gc` should use // not /* */

### Theme
- must support highlight groups
- must be different colors: params, locals, members

### Trouble
   I like the idea, but I would rather not be forced to go through the quickfix list and `errorformat` insanity. Trouble would need its own sort of parsing language like `errorformat` but I'm sure we can do better in 2024 and with Lua. Maybe similar to problem matchers?

### Open Neorg in vsplit
### Code snippets
Select some code, hit a hotkey, go to a note, paste the code, and get the code wrapped in code block with some metadata like:
- filepath/filename
- function

### ( ) Quickly edit config
- (x) shell alias
- ( ) `:Config`

### (x) Telescope preview width reduced for 'gr'
I'd like to see more of the filepath.

### C++ workflow
#### Build
    1. Press key
    2. Live output opens in small window, pref color support (term?)
    3. On failure, open Trouble/qfl with parsed output
    4. On complete, close window
    5. Press key to jump to next error
    6. Press key to jump to next warning

#### Debug
    Should be its own "mode" ideally. It's kind of annoying to type `<leader>db` instead of just `db` or even `b` to set a breakpoint.
#### Project-specific tasks
    Some use Make, some use CMake.

    It would be nice to have to change my build mapping callback function for swapping b/w projects. I should be able to choose based on directory root (Lsp workspace root?)

    Could use `tasks.json` or some other format. If we don't care about supporting vs code, we could do Lua.

### Function overload signatures not just "4 overloads"

### Parameter hints/types while typing function call

### Parent dir in status line

### std docs for word under cursor
Most standard library implementations don't have great docs.

### std man docs
`:h std::vector`
