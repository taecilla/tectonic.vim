Operate in buffers and files at the same time! This plug-in
exposes three commands:

- `:Delete[!] [{bufname}]` will delete the buffer and the file on
  disk.
- `:Move[!] {filename}` will change the buffer name and the file
  name relative to `:pwd`.
- `:Rename[!] {filename}` will do the same but relative to the
  buffer directory.

`!` variants force the command in case your want to overwrite an
existing file or discard a buffer's changes.

Also when you edit a file in a directory that doesn't exists it
will ask you if you want to create that directory.
